-----------------------------------
-- Spell: Blizzard V
-- Deals ice damage to an enemy.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local spellParams = {}
    
    if (caster:isPC() or caster:getObjType() == xi.objType.TRUST) then
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_5, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V0 = 850
        spellParams.V50 = 1070
        spellParams.V100 = 1270
        spellParams.V200 = 1650
        spellParams.M0 = 4.4
        spellParams.M50 = 4
        spellParams.M100 = 3.8
        spellParams.M200 = 3    
    end

    return doElementalNuke(caster, spell, target, spellParams)
end

return spell_object
