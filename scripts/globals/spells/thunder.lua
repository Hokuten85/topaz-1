-----------------------------------------
-- Spell: Fire
-- Deals fire damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    
    if (caster:isPC()) then
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_1, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 60
        spellParams.V0 = 85
        spellParams.V50 = 135
        spellParams.V100 = 185
        spellParams.V200 = 185
        spellParams.M = 1
        spellParams.M0 = 1
        spellParams.M50 = 1
        spellParams.M100 = 0
        spellParams.M200 = 0
        spellParams.I = 78    
    end

    return doElementalNuke(caster, spell, target, spellParams)
end
