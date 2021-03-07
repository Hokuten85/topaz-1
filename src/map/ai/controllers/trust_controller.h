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

#ifndef _TRUSTCONTROLLER_H
#define _TRUSTCONTROLLER_H

#include <memory>

#include "mob_controller.h"
#include "../ai_container.h"

class CCharEntity;
class CTrustEntity;

namespace gambits
{
    class CGambitsContainer;
}

enum class ACTION_TYPE : uint16
{
    NOTHING = 0,
    SPELL   = 1,
    JA      = 2,
};

struct QueueAction_t
{
    ACTION_TYPE action_type = ACTION_TYPE::NOTHING;
    uint16      targId = 0;
    uint16      actionId = 0;
    bool        requiresMove = false;
    bool        pianissimo   = false;

    bool parseInput(std::string key, uint16 value)
    {
        if (key.compare("action_type") == 0)
        {
            action_type = static_cast<ACTION_TYPE>(value);
        }
        else if (key.compare("targId") == 0)
        {
            targId = static_cast<uint16>(value);
        }
        else if (key.compare("actionId") == 0)
        {
            actionId = value;
        }
        else if (key.compare("requiresMove") == 0)
        {
            requiresMove = (bool)value;
        }
        else
        {
            // TODO: Log error
            return false;
        }
        return true;
    }
};

class CTrustController : public CMobController
{
public:
    CTrustController(CCharEntity*, CTrustEntity*);
    ~CTrustController() override;

    void Tick(time_point) override;
    void Despawn() override;

    bool Ability(uint16 targid, uint16 abilityid) override;
    bool Cast(uint16 targid, SpellID spellid) override;
    bool Cast(uint16 targid, SpellID spellid, bool pianissimo);
    virtual bool UseItem(uint16 targid);

    bool RangedAttack(uint16 targid);

    static constexpr float RoamDistance    = { 2.0f };
    static constexpr float SpawnDistance   = { 3.0f };
    static constexpr float CastingDistance = { 18.0f };
    static constexpr float WarpDistance    = { 30.0f };

    CBattleEntity* GetTopEnmity();

    uint8 GetPartyPosition();

    std::unique_ptr<gambits::CGambitsContainer> m_GambitsContainer;
    std::queue<QueueAction_t*>* actionQueue = new std::queue<QueueAction_t*>;

    std::map<SPELLFAMILY, EFFECT> familyToEffectMap{
        { SPELLFAMILY::SPELLFAMILY_MARCH, EFFECT::EFFECT_MARCH },
        { SPELLFAMILY::SPELLFAMILY_MADRIGAL, EFFECT::EFFECT_MADRIGAL },
        { SPELLFAMILY::SPELLFAMILY_VALOR_MINUET, EFFECT::EFFECT_MINUET },
        { SPELLFAMILY::SPELLFAMILY_KNIGHTS_MINNE, EFFECT::EFFECT_MINNE },
        { SPELLFAMILY::SPELLFAMILY_ARMYS_PAEON, EFFECT::EFFECT_PAEON },
        { SPELLFAMILY::SPELLFAMILY_MAGES_BALLAD, EFFECT::EFFECT_BALLAD },
        { SPELLFAMILY::SPELLFAMILY_PRELUDE, EFFECT::EFFECT_PRELUDE }
    };

private:
    void DoCombatTick(time_point tick) override;
    void DoRoamTick(time_point tick) override;

    void Declump(CCharEntity* PMaster, CBattleEntity* PTarget);
    void PathOutToDistance(CBattleEntity* PTarget, float amount);

    CBattleEntity* m_LastTopEnmity;

    time_point m_LastRepositionTime;
    uint8      m_failedRepositionAttempts;
    bool       m_InTransit;

    time_point                        m_CombatEndTime;
    time_point                        m_LastHealTickTime;
    std::vector<std::chrono::seconds> m_tickDelays      = { 15s, 10s, 10s, 3s };
    std::size_t                       m_NumHealingTicks = { 0 };

    time_point m_LastRangedAttackTime;
};

#endif // _TRUSTCONTROLLER
