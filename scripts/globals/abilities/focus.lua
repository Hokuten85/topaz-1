-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local power = 25 + player:getMod(tpz.mod.FOCUS_EFFECT)
    player:addStatusEffect(tpz.effect.FOCUS, power, 0, 180)
end

return ability_object
