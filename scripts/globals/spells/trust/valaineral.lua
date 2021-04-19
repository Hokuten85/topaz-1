-----------------------------------
-- Trust: Valaineral
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

local message_page_offset = 14

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)

    -- Records of Eminence: Alter Ego: Valaineral
    if caster:getEminenceProgress(933) then
        xi.roe.onRecordTrigger(caster, 933)
    end

    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob) 
    --[[
        Summon: With your courage and valor, Altana's children will live to see a brighter day.
        Summon (Formerly): Let the Royal Family’s blade be seared forever into their memories!
    ]]
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.SPAWN)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOD, ai.r.ITEM, 0, 0)

    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
                        
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DEFENDER,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.DEFENDER)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HOLY_CIRCLE,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.HOLY_CIRCLE)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
                        
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, xi.effect.WARCRY,
                        ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 70,
                        ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
                        
    --mob:addMod(xi.mod.ACC, 200)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DEATH)
end

return spell_object
