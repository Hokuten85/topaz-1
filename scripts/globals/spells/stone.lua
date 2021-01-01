-----------------------------------------
-- Spell: Stone
-- Deals earth damage to an enemy.
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
        spellParams.V = 10
        spellParams.V0 = 10
        spellParams.V50 = 110
        spellParams.V100 = 160
        spellParams.V200 = 160
        spellParams.M = 1
        spellParams.M0 = 2
        spellParams.M50 = 1
        spellParams.M100 = 0
        spellParams.M200 = 0
        spellParams.I = 16
    end

    return doElementalNuke(caster, spell, target, spellParams)
end
