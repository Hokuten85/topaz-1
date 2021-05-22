-----------------------------------
-- Trust: Zeid II
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------
local spell_object = {}

local message_page_offset = 86

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, 906)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.SPAWN)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOD, ai.r.ITEM, 0, 0)

    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)

    -- Non-stun things
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.ARCANE_CIRCLE)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)
    
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.STR_BOOST, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ABSORB_STR)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DEX_BOOST, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ABSORB_DEX)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ACCURACY_BOOST, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ABSORB_ACC)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DEATH)
end

return spell_object
