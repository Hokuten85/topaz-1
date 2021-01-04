-----------------------------------------
-- Trust: Zeid II
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 86

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 906)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)

    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)

    -- Non-stun things
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SOULEATER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.LAST_RESORT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ARCANE_CIRCLE)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)
    
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STR_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ABSORB_STR)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DEX_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ABSORB_DEX)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ACCURACY_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ABSORB_ACC)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end
