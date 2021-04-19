-----------------------------------
-- Trust: Shantotto II
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

local message_page_offset = 112

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.SHANTOTTO)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOD, ai.r.ITEM, 0, 0)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 45)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.WEAKNESS, xi.magic.spellFamily.NONE, 5)
    
    mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.TARGET, ['condition'] = ai.c.NOT_SC_AVAILABLE, ['argument'] = 0, ['actionTarget'] = 1
            },
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_HAS_TOP_ENMITY, ['argument'] = 0,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.WEAKNESS, ['argument'] = xi.magic.spellFamily.NONE,
            },
        },
        ['retry_delay'] = 5
    })

    local power = mob:getMainLvl() / 5
    mob:addMod(xi.mod.MATT, power)
    mob:addMod(xi.mod.MACC, power)
    mob:addMod(xi.mod.HASTE_MAGIC, 10)
    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, message_page_offset, xi.trust.message_offset.DEATH)
end

return spell_object
