-----------------------------------
-- Trust: Tenzen
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

local message_page_offset = 12

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, 1014)
end

spell_object.onSpellCast = function(caster, target, spell)

    -- Records of Eminence: Alter Ego: Tenzen
    if caster:getEminenceProgress(935) then
        xi.roe.onRecordTrigger(caster, 935)
    end

    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, message_page_offset, {
        [xi.magic.spell.IROHA] = xi.trust.message_offset.TEAMWORK_1,
    })

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOD, ai.r.ITEM, 0, 0)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLADE_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLADE_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLADE_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLADE_BASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, xi.ja.HASSO)

    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.THIRD_EYE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, xi.ja.MEDITATE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GT, 1000, ai.r.JA, ai.s.SPECIFIC, xi.ja.SEKKANOKI)    
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARDING_CIRCLE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DEATH)
end

return spell_object
