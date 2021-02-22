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
    return tpz.trust.canCast(caster, spell, tpz.magic.spell.SHANTOTTO)
end

spell_object.onSpellCast = function(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FOOD, ai.r.ITEM, 0, 0)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE, 45)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.WEAKNESS, tpz.magic.spellFamily.NONE, 5)
    
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
                ['reaction'] = ai.r.MA, ['select'] = ai.s.WEAKNESS, ['argument'] = tpz.magic.spellFamily.NONE,
            },
        },
        ['retry_delay'] = 5
    })

    local power = mob:getMainLvl() / 5
    mob:addMod(tpz.mod.MATT, power)
    mob:addMod(tpz.mod.MACC, power)
    mob:addMod(tpz.mod.HASTE_MAGIC, 10)
    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end

return spell_object
