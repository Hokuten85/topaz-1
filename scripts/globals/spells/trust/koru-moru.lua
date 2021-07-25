-----------------------------------
-- Trust: Koru-Moru
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.SHANTOTTO] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.SHANTOTTO_II] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.message_offset.TEAMWORK_2,
    })
    
    --mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.ITEM, 0, 0)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.ITEM, 0, 0)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.CONVERT)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 60, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS_POWER, xi.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HASTE_II, 0, {["extra"] = {["notStatusPower"] = 2998}})
    mob:addSimpleGambit(ai.t.CASTER, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.TANK, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, xi.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FLURRY)
    mob:addSimpleGambit(ai.t.TOP_ENMITY, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PHALANX_II)

    local extra = {["extra"] = {["maxFails"] = 2}}
    
    if mob:getCurrentRegion() == xi.region.DYNAMIS then
        mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENCE, 0, extra)
        mob:addSimpleGambit(ai.t.ADDS, ai.c.NOT_STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SLEEPGA, 0, extra)
        mob:addSimpleGambit(ai.t.ADDS, ai.c.NOT_STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SLEEP, 0, extra)
    end

    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BIO, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.BIO, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DISTRACT, 0, extra)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.BLIND, 0, extra)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELL)
 
    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
