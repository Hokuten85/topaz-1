-----------------------------------
-- Trust: Joachim
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)

    -- Records of Eminence: Alter Ego: Joachim
    if caster:getEminenceProgress(937) then
        xi.roe.onRecordTrigger(caster, 937)
    end

    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)
    
    --mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.ITEM, 0, 0)
    --mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.ITEM, 0, 0)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA)

    mob:addSimpleGambit(0,0,0,ai.r.BRD_SUPPORT,0,0)
    
    local extra = {["extra"] = {["maxFails"] = 2}}
    if mob:getCurrentRegion() == xi.region.DYNAMIS then
        mob:addSimpleGambit(ai.t.ADDS, ai.c.NOT_STATUS, ai.effect.IS_ASLEEP, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HORDE_LULLABY, 0, extra)
        mob:addSimpleGambit(ai.t.ADDS, ai.c.NOT_STATUS, ai.effect.IS_ASLEEP, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FOE_LULLABY, 0, extra)
    end

    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MAGIC_FINALE, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.ELEGY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ELEGY, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.REQUIEM, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FOE_REQUIEM, 0, extra)


    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    -- Try and ranged attack every 60s
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 5)

    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
