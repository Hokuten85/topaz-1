/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "fmt/printf.h"
#include "trustentity.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/trust_controller.h"
#include "../ai/helpers/gambits_container.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/item_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/mobskill_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/weaponskill_state.h"
#include "../attack.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../packets/char_health.h"
#include "../packets/entity_update.h"
#include "../packets/trust_sync.h"
#include "../packets/chat_message.h"
#include "../recast_container.h"
#include "../status_effect_container.h"
#include "../utils/battleutils.h"
#include "../utils/trustutils.h"
#include "../trade_container.h"
#include "../universal_container.h"
#include "../utils/charutils.h"
#include "../item_container.h"
#include "../utils/itemutils.h"

CTrustEntity::CTrustEntity(CCharEntity* PChar)
{
    objtype        = TYPE_TRUST;
    m_EcoSystem    = ECOSYSTEM::UNCLASSIFIED;
    allegiance     = ALLEGIANCE_TYPE::PLAYER;
    m_MobSkillList = 0;
    PMaster        = PChar;
    UContainer     = new CUContainer();
    PAI            = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CTrustController>(PChar, this),
                                         std::make_unique<CTargetFind>(this));

    memset(&equip, 0, sizeof(equip));
    food = nullptr;
}

void CTrustEntity::PostTick()
{
    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::PostTick();
    if (loc.zone && updatemask && status != STATUS_TYPE::DISAPPEAR)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));

        if (PMaster && PMaster->PParty && updatemask & UPDATE_HP)
        {
            PMaster->ForParty([this](auto PMember) { static_cast<CCharEntity*>(PMember)->pushPacket(new CCharHealthPacket(this)); });
        }
        updatemask = 0;
    }
}

void CTrustEntity::FadeOut()
{
    CBaseEntity::FadeOut();
    loc.zone->PushPacket(this, (loc.zone->m_BattlefieldHandler) ? CHAR_INZONE : CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_DESPAWN, UPDATE_NONE));
}

void CTrustEntity::Die()
{
    luautils::OnMobDeath(this, nullptr);
    PAI->ClearStateStack();
    PAI->Internal_Die(0s);
    ((CCharEntity*)PMaster)->RemoveTrust(this);

    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::Die();
}

void CTrustEntity::Spawn()
{
    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    // we need to skip CMobEntity's spawn because it calculates stats (and our stats are already calculated)
    CBattleEntity::Spawn();
    luautils::OnMobSpawn(this);
    ((CCharEntity*)PMaster)->pushPacket(new CTrustSyncPacket((CCharEntity*)PMaster, this));
}

void CTrustEntity::OnAbility(CAbilityState& state, action_t& action)
{
    auto* PAbility = state.GetAbility();
    auto* PTarget  = static_cast<CBattleEntity*>(state.GetTarget());

    std::unique_ptr<CBasicPacket> errMsg;
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            return;
        }

        if (battleutils::IsParalyzed(this))
        {
            loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        action.id                    = this->id;
        action.actiontype            = PAbility->getActionType();
        action.actionid              = PAbility->getID();
        action.recast                = PAbility->getRecastTime();

        PAI->TargetFind->reset();

        if (PAbility->isAoE())
        {
            PAI->TargetFind->findWithinArea(this, AOE_RADIUS::ATTACKER, PAbility->getRange());
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PTarget);
        }

        for (auto&& PTarget : PAI->TargetFind->m_targets)
        {
            actionList_t& actionList     = action.getNewActionList();
            actionList.ActionTargetID    = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction        = REACTION::NONE;
            actionTarget.speceffect      = PAbility->isAoE() ? SPECEFFECT::NONE : SPECEFFECT::RECOIL;
            actionTarget.animation       = PAbility->getAnimationID();
            actionTarget.param           = 0;
            auto prevMsg                 = actionTarget.messageID;

            int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            if (prevMsg == actionTarget.messageID)
            {
                actionTarget.messageID = PAbility->getMessage();
            }
            if (actionTarget.messageID == 0)
            {
                actionTarget.messageID = MSGBASIC_USES_JA;
            }
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param     = -value;
            }
        }

        state.ApplyEnmity();

        PRecastContainer->Add(RECAST_ABILITY, action.actionid, action.recast);
    }
}

void CTrustEntity::OnRangedAttack(CRangeState& state, action_t& action)
{
    auto* PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int32 damage      = 0;
    int32 totalDamage = 0;

    action.id         = id;
    action.actiontype = ACTION_RANGED_FINISH;

    actionList_t& actionList  = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.reaction        = REACTION::HIT;   // 0x10
    actionTarget.speceffect      = SPECEFFECT::HIT; // 0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
    actionTarget.messageID       = 352;

    /*
    CItemWeapon* PItem = (CItemWeapon*)this->getEquip(SLOT_RANGED);
    CItemWeapon* PAmmo = (CItemWeapon*)this->getEquip(SLOT_AMMO);

    bool ammoThrowing = PAmmo ? PAmmo->isThrowing() : false;
    bool rangedThrowing = PItem ? PItem->isThrowing() : false;

    uint8 slot = SLOT_RANGED;

    if (ammoThrowing)
    {
        slot = SLOT_AMMO;
        PItem = nullptr;
    }
    if (rangedThrowing)
    {
        PAmmo = nullptr;
    }
    */

    uint8 slot         = SLOT_RANGED;
    uint8 shadowsTaken = 0;
    uint8 hitCount     = 1; // 1 hit by default
    uint8 realHits     = 0; // to store the real number of hit for tp multipler
    auto  ammoConsumed = 0;
    bool  hitOccured   = false; // track if player hit mob at all
    bool  isSange      = false;
    bool  isBarrage    = StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0);

    /*
    // if barrage is detected, getBarrageShotCount also checks for ammo count
    if (!ammoThrowing && !rangedThrowing && isBarrage)
    {
        hitCount += battleutils::getBarrageShotCount(this);
    }
    else if (ammoThrowing && this->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
    {
        isSange = true;
        hitCount += getMod(Mod::UTSUSEMI);
    }
    */

    // loop for barrage hits, if a miss occurs, the loop will end
    for (uint8 i = 1; i <= hitCount; ++i)
    {
        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID  = 32;
            actionTarget.reaction   = REACTION::EVADE;
            actionTarget.speceffect = SPECEFFECT::NONE;
            hitCount                = i; // end barrage, shot missed
        }
        else if (xirand::GetRandomNumber(100) < battleutils::GetRangedHitRate(this, PTarget, isBarrage)) // hit!
        {
            // absorbed by shadow
            if (battleutils::IsAbsorbByShadow(PTarget))
            {
                shadowsTaken++;
            }
            else
            {
                bool  isCritical = xirand::GetRandomNumber(100) < battleutils::GetCritHitRate(this, PTarget, true);
                float pdif       = battleutils::GetRangedDamageRatio(this, PTarget, isCritical);

                if (isCritical)
                {
                    actionTarget.speceffect = SPECEFFECT::CRITICAL_HIT;
                    actionTarget.messageID  = 353;
                }

                // at least 1 hit occured
                hitOccured = true;
                realHits++;

                if (isSange)
                {
                    // change message to sange
                    actionTarget.messageID = 77;
                }

                damage = (int32)((this->GetRangedWeaponDmg() + battleutils::GetFSTR(this, PTarget, slot)) * pdif);
                /*
                if (slot == SLOT_RANGED)
                {
                    if (state.IsRapidShot())
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, PHYSICAL_ATTACK_TYPE::RAPID_SHOT, SLOT_RANGED);
                    }
                    else
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, PHYSICAL_ATTACK_TYPE::RANGED, SLOT_RANGED);
                    }

                    if (PItem != nullptr)
                    {
                        charutils::TrySkillUP(this, (SKILLTYPE)PItem->getSkillType(), PTarget->GetMLevel());
                    }
                }
                else if (slot == SLOT_AMMO && PAmmo != nullptr)
                {
                    charutils::TrySkillUP(this, (SKILLTYPE)PAmmo->getSkillType(), PTarget->GetMLevel());
                }
                */
            }
        }
        else // miss
        {
            actionTarget.reaction   = REACTION::EVADE;
            actionTarget.speceffect = SPECEFFECT::NONE;
            actionTarget.messageID  = 354;
            hitCount                = i; // end barrage, shot missed
        }
        /*
        // check for recycle chance
        uint16 recycleChance = getMod(Mod::RECYCLE);
        if (charutils::hasTrait(this, TRAIT_RECYCLE))
        {
            recycleChance += PMeritPoints->GetMeritValue(MERIT_RECYCLE, this);
        }

        // Only remove unlimited shot on hit
        if (hitOccured && this->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
        {
            StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
            recycleChance = 100;
        }

        if (PAmmo != nullptr && xirand::GetRandomNumber(100) > recycleChance)
        {
            ++ammoConsumed;
            TrackArrowUsageForScavenge(PAmmo);
            if (PAmmo->getQuantity() == i)
            {
                hitCount = i;
            }
        }
        */
        totalDamage += damage;
    }

    // if a hit did occur (even without barrage)
    if (hitOccured)
    {
        // any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
        if (actionTarget.reaction == REACTION::EVADE && (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) || isSange))
        {
            actionTarget.messageID  = 352;
            actionTarget.reaction   = REACTION::HIT;
            actionTarget.speceffect = SPECEFFECT::CRITICAL_HIT;
        }

        actionTarget.param =
            battleutils::TakePhysicalDamage(this, PTarget, PHYSICAL_ATTACK_TYPE::RANGED, totalDamage, false, slot, realHits, nullptr, true, true);

        // lower damage based on shadows taken
        if (shadowsTaken)
        {
            actionTarget.param = (int32)(actionTarget.param * (1 - ((float)shadowsTaken / realHits)));
        }

        // absorb message
        if (actionTarget.param < 0)
        {
            actionTarget.param     = -(actionTarget.param);
            actionTarget.messageID = 382;
        }

        /*
        //add additional effects
        //this should go AFTER damage taken
        //or else sleep effect won't work
        //battleutils::HandleRangedAdditionalEffect(this,PTarget,&Action);
        //TODO: move all hard coded additional effect ammo to scripts
        if ((PAmmo != nullptr && battleutils::GetScaledItemModifier(this, PAmmo, Mod::ADDITIONAL_EFFECT) > 0) ||
            (PItem != nullptr && battleutils::GetScaledItemModifier(this, PItem, Mod::ADDITIONAL_EFFECT) > 0)) {}
        luautils::OnAdditionalEffect(this, PTarget, (PAmmo != nullptr ? PAmmo : PItem), &actionTarget, totalDamage);
         */
    }
    else if (shadowsTaken > 0)
    {
        // shadows took damage
        actionTarget.messageID = 0;
        actionTarget.reaction  = REACTION::EVADE;
        PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, shadowsTaken, MSGBASIC_SHADOW_ABSORB));
    }

    if (actionTarget.speceffect == SPECEFFECT::HIT && actionTarget.param > 0)
    {
        actionTarget.speceffect = SPECEFFECT::RECOIL;
    }

    // remove barrage effect if present
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0))
    {
        StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE, 0);
    }
    else if (isSange)
    {
        uint16 power = StatusEffectContainer->GetStatusEffect(EFFECT_SANGE)->GetPower();

        // remove shadows
        while (realHits-- && xirand::GetRandomNumber(100) <= power && battleutils::IsAbsorbByShadow(this))
        {
            ;
        }

        StatusEffectContainer->DelStatusEffect(EFFECT_SANGE);
    }
    battleutils::ClaimMob(PTarget, this);
    // battleutils::RemoveAmmo(this, ammoConsumed);
    // only remove detectables
    StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
}

bool CTrustEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (PInitiator->objtype == TYPE_TRUST && PMaster == PInitiator->PMaster)
    {
        return true;
    }

    if (targetFlags & TARGET_PLAYER_PARTY && PInitiator->objtype == TYPE_PET && PInitiator->allegiance == allegiance)
    {
        return true;
    }

    if (targetFlags & TARGET_PLAYER_PARTY && PInitiator->allegiance == allegiance && PMaster)
    {
        return PInitiator->PParty == PMaster->PParty;
    }

    return CMobEntity::ValidTarget(PInitiator, targetFlags);
}

void CTrustEntity::OnDespawn(CDespawnState& /*unused*/)
{
    if (GetHPP())
    {
        // Don't call this when despawning after being killed
        luautils::OnMobDespawn(this);
    }
    FadeOut();
    PAI->EventHandler.triggerListener("DESPAWN", CLuaBaseEntity(this));
}

void CTrustEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::OnCastFinished(state, action);

    auto* PSpell = state.GetSpell();
    for (const auto* container : static_cast<CTrustController*>(this->PAI->GetController())->m_GambitsContainer->all_gambits)
    {
        for (const auto& gambit : *container)
        {
            if (gambit->extra.maxFails > 0)
            {
                for (auto& g_action : gambit->actions)
                {
                    if (g_action.reaction == gambits::G_REACTION::MA && (g_action.select_arg == static_cast<uint16>(PSpell->getID()) || g_action.select_arg == static_cast<uint16>(PSpell->getSpellFamily())))
                    {
                        bool magicSuccess = false;
                        for (auto& actionList : action.actionLists)
                        {
                            for (auto& actionTarget : actionList.actionTargets)
                            {
                                if (actionTarget.messageID != MSGBASIC_MAGIC_NO_EFFECT && actionTarget.messageID != MSGBASIC_MAGIC_RESIST)
                                {
                                    magicSuccess = true;
                                }
                            }
                        }

                        magicSuccess ? gambit->extra.failCount = 0 : gambit->extra.failCount++;
                    }
                }
            }
        }
    }

    PRecastContainer->Add(RECAST_MAGIC, static_cast<uint16>(PSpell->getID()), action.recast);
}

void CTrustEntity::OnMobSkillFinished(CMobSkillState& state, action_t& action)
{
    CMobEntity::OnMobSkillFinished(state, action);
}

void CTrustEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::OnWeaponSkillFinished(state, action);

    auto* PWeaponSkill  = state.GetSkill();
    auto* PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int16 tp = state.GetSpentTP();
    tp       = battleutils::CalculateWeaponSkillTP(this, PWeaponSkill, tp);

    if (distance(loc.p, PBattleTarget->loc.p) - PBattleTarget->m_ModelSize <= PWeaponSkill->getRange())
    {
        PAI->TargetFind->reset();
        if (PWeaponSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PBattleTarget, AOE_RADIUS::TARGET, 10);
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PBattleTarget);
        }

        for (auto&& PTarget : PAI->TargetFind->m_targets)
        {
            bool          primary     = PTarget == PBattleTarget;
            actionList_t& actionList  = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            uint16         tpHitsLanded;
            uint16         extraHitsLanded;
            int32          damage;
            CBattleEntity* taChar = battleutils::getAvailableTrickAttackChar(this, PTarget);

            actionTarget.reaction                           = REACTION::NONE;
            actionTarget.speceffect                         = SPECEFFECT::NONE;
            actionTarget.animation                          = PWeaponSkill->getAnimationId();
            actionTarget.messageID                          = 0;
            std::tie(damage, tpHitsLanded, extraHitsLanded) = luautils::OnUseWeaponSkill(this, PTarget, PWeaponSkill, tp, primary, action, taChar);

            if (!battleutils::isValidSelfTargetWeaponskill(PWeaponSkill->getID()))
            {
                if (primary && PBattleTarget->objtype == TYPE_MOB)
                {
                    luautils::OnWeaponskillHit(PBattleTarget, this, PWeaponSkill->getID());
                }
            }
            else // Self-targetting WS restoring MP
            {
                actionTarget.messageID = primary ? 224 : 276; // Restores mp msg
                actionTarget.reaction  = REACTION::HIT;
                damage                 = std::max(damage, 0);
                actionTarget.param     = addMP(damage);
            }

            if (primary)
            {
                if (PWeaponSkill->getPrimarySkillchain() != 0)
                {
                    // NOTE: GetSkillChainEffect is INSIDE this if statement because it
                    //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(PBattleTarget, PWeaponSkill->getPrimarySkillchain(),
                                                                        PWeaponSkill->getSecondarySkillchain(), PWeaponSkill->getTertiarySkillchain());
                    if (effect != SUBEFFECT_NONE)
                    {
                        actionTarget.addEffectParam = battleutils::TakeSkillchainDamage(this, PBattleTarget, damage, taChar);
                        if (actionTarget.addEffectParam < 0)
                        {
                            actionTarget.addEffectParam   = -actionTarget.addEffectParam;
                            actionTarget.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            actionTarget.addEffectMessage = 287 + effect;
                        }
                        actionTarget.additionalEffect = effect;
                    }
                }
            }
        }
    }
}

void CTrustEntity::EquipItem(CItemEquipment* PItem, int8 slotId)
{
    if (PItem->getJobs() & (1 << (this->GetMJob() - 1)))
    {
        auto& equipMods = this->equipmentMods;
        auto  iterator  = equipMods.find(slotId);

        auto oldItem = this->equip[slotId];
        if (oldItem != nullptr)
        {
            if (iterator != equipMods.end())
            {
                this->delEquipModifiers(&iterator->second, oldItem->getReqLvl(), slotId);
            }
        }

        std::vector<CModifier> consolidatedMods;
        for (auto& modifier : PItem->modList)
        {
            auto mergeIt = std::find_if(consolidatedMods.begin(), consolidatedMods.end(), [&modifier](CModifier& mod) { return mod.getModID() == modifier.getModID(); });
            if (mergeIt == consolidatedMods.end())
            {
                consolidatedMods.push_back(modifier);
            }
            else
            {
                auto& mod = *mergeIt;
                mod.setModAmount(mod.getModAmount() + modifier.getModAmount());
            }
        }

        if (iterator == equipMods.end())
        {
            equipMods.emplace(slotId, consolidatedMods);
        }
        else
        {
            for (auto& modifier : consolidatedMods)
            {
                auto& modMap = iterator->second;
                auto  it2    = std::find_if(modMap.begin(), modMap.end(), [&modifier](CModifier& mod) { return mod.getModID() == modifier.getModID(); });

                if (it2 == modMap.end())
                {
                    modMap.push_back(modifier);
                }
                else
                {
                    auto& mod = *it2;
                    if (mod.getModAmount() < modifier.getModAmount())
                    {
                        mod.setModAmount(modifier.getModAmount());
                    }
                }
            }
        }

        this->addEquipModifiers(&equipMods.at(slotId), PItem->getReqLvl(), slotId);

        if (slotId >= 0 && slotId <= 3)
        {
            if (PItem->isType(ITEM_WEAPON) || PItem->IsShield())
            {
                if (this->m_Weapons[(SLOTTYPE)slotId] != nullptr)
                {
                    if (!PItem->IsShield())
                    {
                        auto weapon        = static_cast<CItemWeapon*>(PItem);
                        auto currentWeapon = static_cast<CItemWeapon*>(this->m_Weapons[(SLOTTYPE)slotId]);
                        if ((float)weapon->getDamage() / weapon->getDelay() > (float)currentWeapon->getDamage() / weapon->getDelay())
                        {
                            this->m_Weapons[(SLOTTYPE)slotId] = PItem;
                            this->equip[slotId]               = PItem;
                        }
                    }
                    else
                    {
                        auto currentShield = this->m_Weapons[(SLOTTYPE)slotId];
                        if (PItem->getShieldAbsorption() > currentShield->getShieldAbsorption())
                        {
                            this->m_Weapons[(SLOTTYPE)slotId] = PItem;
                        }

                        auto blockRate = [](CItemEquipment* PEquip) {
                            if (PEquip->IsShield())
                            {
                                switch (PEquip->getShieldSize())
                                {
                                    case 1: // buckler
                                        return 55;
                                        break;
                                    case 2: // round
                                    case 5: // aegis
                                        return 50;
                                        break;
                                    case 3: // kite
                                        return 45;
                                        break;
                                    case 4: // tower
                                        return 30;
                                        break;
                                    case 6: // ochain
                                        return 110;
                                        break;
                                    default:
                                        return 0;
                                }
                            }

                            return 0;
                        };

                        if (blockRate(PItem) > blockRate(currentShield))
                        {
                            this->equip[slotId] = PItem;
                        }
                    }
                }
                else
                {
                    this->m_Weapons[(SLOTTYPE)slotId] = PItem;
                    this->equip[slotId]               = PItem;
                }
            }
        }
        else
        {
            this->equip[slotId] = PItem;
        }

        this->UpdateHealth();
    }
}

void CTrustEntity::HandleTrade(CCharEntity* PChar)
{
    for (int32 tradeSlotID = 0; tradeSlotID < TRADE_CONTAINER_SIZE; ++tradeSlotID)
    {
        if (PChar->TradeContainer->getItemID(tradeSlotID) > 0)
        {
            auto PItem = PChar->TradeContainer->getItem(tradeSlotID);
            auto tradeQuantity = PChar->TradeContainer->getQuantity(tradeSlotID);

            auto newPItem = itemutils::GetItem(PItem->getID());
            newPItem->setQuantity(tradeQuantity);
            memcpy(newPItem->m_extra, PItem->m_extra, sizeof(PItem->m_extra));

            if ((newPItem->isType(ITEM_EQUIPMENT) || newPItem->isType(ITEM_WEAPON)) && !newPItem->isSubType(ITEM_CHARGED))
            {

                for (uint8 j = 0; j < 4; ++j)
                {
                    // found a match, apply the augment
                    if (((CItemEquipment*)newPItem)->getAugment(j) != 0)
                    {
                        ((CItemEquipment*)newPItem)->ApplyAugment(j);
                    }
                }
            }

            int8 slotId = -1;
            if (newPItem->isType(ITEM_EQUIPMENT))
            {
                auto PEquip = static_cast<CItemEquipment*>(newPItem);
                std::string itemName = (const char*)PEquip->getName();
                std::transform(itemName.begin(), itemName.end(), itemName.begin(), [](char ch) { return ch == '_' ? ' ' : ch; });

                if (!(PEquip->getJobs() & (1 << (this->GetMJob() - 1))) || this->GetMLevel() < PEquip->getReqLvl())
                {
                    ((CCharEntity*)this->PMaster)->pushPacket(new CChatMessagePacket((CCharEntity*)this->PMaster, CHAT_MESSAGE_TYPE::MESSAGE_PARTY, fmt::sprintf("%s, I cannot use this %s.", this->PMaster->GetName(), itemName), this->packetName));
                    continue;
                }

                auto equipSlotId = PEquip->getEquipSlotId();
                if (equipSlotId & (1 << SLOT_MAIN))
                {
                    if (!(equipSlotId & (1 << SLOT_SUB)) || tradeSlotID % 2 == 0)
                    {
                        slotId = SLOT_MAIN;
                    }
                }
                else if (equipSlotId & (1 << SLOT_SUB))
                {
                    if (!(equipSlotId & (1 << SLOT_MAIN)) || tradeSlotID % 2 == 1)
                    {
                        slotId = SLOT_SUB;
                    }
                }
                else if (equipSlotId & (1 << SLOT_RANGED))
                {
                    slotId = SLOT_RANGED;
                }
                else if (equipSlotId & (1 << SLOT_AMMO))
                {
                    slotId = SLOT_AMMO;
                }
                else if (equipSlotId & (1 << SLOT_HEAD))
                {
                    slotId = SLOT_HEAD;
                }
                else if (equipSlotId & (1 << SLOT_BODY))
                {
                    slotId = SLOT_BODY;
                }
                else if (equipSlotId & (1 << SLOT_HANDS))
                {
                    slotId = SLOT_HANDS;
                }
                else if (equipSlotId & (1 << SLOT_LEGS))
                {
                    slotId = SLOT_LEGS;
                }
                else if (equipSlotId & (1 << SLOT_FEET))
                {
                    slotId = SLOT_FEET;
                }
                else if (equipSlotId & (1 << SLOT_NECK))
                {
                    slotId = SLOT_NECK;
                }
                else if (equipSlotId & (1 << SLOT_WAIST))
                {
                    slotId = SLOT_WAIST;
                }
                else if (equipSlotId & (1 << SLOT_EAR1))
                {
                    if (tradeSlotID % 2 == 0)
                    {
                        slotId = SLOT_EAR1;
                    }
                    else
                    {
                        slotId = SLOT_EAR2;
                    }
                }
                else if (equipSlotId & (1 << SLOT_RING1))
                {
                    if (tradeSlotID % 2 == 0)
                    {
                        slotId = SLOT_RING1;
                    }
                    else
                    {
                        slotId = SLOT_RING2;
                    }
                }
                else if (equipSlotId & (1 << SLOT_BACK))
                {
                    slotId = SLOT_BACK;
                }

                if (slotId != -1)
                {
                    if (PEquip->getFlag() & ITEM_FLAG_RARE)
                    {
                        auto iterator = PChar->m_TrustEquipment.find(this->m_TrustID);
                        if (iterator != PChar->m_TrustEquipment.end())
                        {
                            auto& trustEquipList = iterator->second;
                            auto  it2            = std::find_if(trustEquipList.begin(), trustEquipList.end(), [&PEquip, &slotId](const CCharEntity::TrustEquip_t* TEquip) { return PEquip->getID() == TEquip->PItem->getID() && slotId != TEquip->EquipSlot; });
                            if (it2 != trustEquipList.end())
                            {
                                ((CCharEntity*)this->PMaster)->pushPacket(new CChatMessagePacket((CCharEntity*)this->PMaster, CHAT_MESSAGE_TYPE::MESSAGE_PARTY, fmt::sprintf("%s, I'm already using %s in a different slot.", this->PMaster->GetName(), itemName), this->packetName));
                                continue;
                            }
                        }
                    }

                    EquipItem(PEquip, slotId);
                }
            }
            else if (PItem->isType(ITEM_USABLE))
            {
                this->food = static_cast<CItemUsable*>(newPItem);
                slotId     = 16;
            }

            if (slotId != -1)
            {
                const char* Query = "INSERT INTO trust_equipment ("
                                    " charid,"
                                    " trustid,"
                                    " equipslotid,"
                                    " itemid,"
                                    " quantity,"
                                    " extra)"
                                    " VALUES(%u,%u,%u,%u,%u,'%s')"
                                    " ON DUPLICATE KEY UPDATE"
                                    " quantity = VALUES(quantity),"
                                    " extra = VALUES(extra)";

                char extra[sizeof(newPItem->m_extra) * 2 + 1];
                Sql_EscapeStringLen(SqlHandle, extra, (const char*)newPItem->m_extra, sizeof(newPItem->m_extra));

                if (Sql_Query(SqlHandle, Query, PChar->id, this->m_TrustID, slotId, newPItem->getID(), newPItem->getQuantity(), extra) == SQL_ERROR)
                {
                    ShowError(CL_RED "trustentity::HandleTrade: Cannot insert item to database\n" CL_RESET);
                    return;
                }

                auto iterator = PChar->m_TrustEquipment.find(this->m_TrustID);
                if (iterator != PChar->m_TrustEquipment.end())
                {
                    auto& trustEquipList = iterator->second;
                    auto  it2            = std::find_if(trustEquipList.begin(), trustEquipList.end(), [&newPItem, &slotId](const CCharEntity::TrustEquip_t* TEquip) { return newPItem->getID() == TEquip->PItem->getID() && slotId == TEquip->EquipSlot; });
                    if (it2 == trustEquipList.end())
                    {
                        trustEquipList.push_back(new CCharEntity::TrustEquip_t{ (uint8)slotId, newPItem });
                    }
                    else
                    {
                        auto trustEquip = *it2;
                        delete trustEquip->PItem;
                        trustEquip->PItem = newPItem;
                    }
                }
                else
                {
                    CCharEntity::TrustEquipList_t trustEquipmentList = { new CCharEntity::TrustEquip_t{ (uint8)slotId, newPItem } };
                    PChar->m_TrustEquipment.insert(std::pair<uint16, CCharEntity::TrustEquipList_t>(this->m_TrustID, trustEquipmentList));
                }
            }
        }
    }

    PChar->TradeContainer->Clean();
}

void CTrustEntity::OnItemFinish(CItemState& state, action_t& action)
{
    auto* PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    auto* PItem   = static_cast<CItemUsable*>(state.GetItem());

    //#TODO: I'm sure this is supposed to be in the action packet... (animation, message)
    if (PItem->getAoE())
    {
        static_cast<CCharEntity*>(PTarget->PMaster)->ForPartyWithTrusts([&](CBattleEntity* PMember) {
            if (!PMember->isDead() && distance(PTarget->loc.p, PMember->loc.p) <= 10)
            {
                luautils::OnItemUse(PMember, PItem);
            }
        });
    }
    else
    {
        luautils::OnItemUse(PTarget, PItem);
    }

    action.id         = this->id;
    action.actiontype = ACTION_ITEM_FINISH;
    action.actionid   = PItem->getID();

    actionList_t& actionList  = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.animation       = PItem->getAnimationID();

    PItem->setSubType(ITEM_UNLOCKED);

    auto newQuantity = PItem->getQuantity() - 1;

    std::string itemName = (const char*)PItem->getName();
    std::transform(itemName.begin(), itemName.end(), itemName.begin(), [](char ch) { return ch == '_' ? ' ' : ch; });

    ((CCharEntity*)this->PMaster)->pushPacket(new CChatMessagePacket((CCharEntity*)this->PMaster, CHAT_MESSAGE_TYPE::MESSAGE_PARTY, fmt::sprintf("%s, I have %u %s remaining.", this->PMaster->GetName(), newQuantity, itemName), this->packetName));

    if (newQuantity == 0)
    {
        const char* Query = "DELETE FROM trust_equipment WHERE charid = %u AND trustid = %u AND equipslotid = %u;";

        Sql_Query(SqlHandle, Query, this->PMaster->id, this->m_TrustID, 16);

        delete PItem;
    }
    else
    {
        const char* Query = "UPDATE trust_equipment "
                            "SET quantity = %u "
                            "WHERE charid = %u AND trustid = %u AND equipslotid = %u;";

        Sql_Query(SqlHandle, Query, newQuantity, this->PMaster->id, this->m_TrustID, 16);

        this->food->setQuantity(newQuantity);
    }
}

int8 CTrustEntity::getShieldSize()
{
    CItemEquipment* PItem = (CItemEquipment*)(this->equip[SLOT_SUB]);

    if (PItem == nullptr)
    {
        return 0;
    }

    if (!PItem->IsShield())
    {
        return 0;
    }

    return PItem->getShieldSize();
}
