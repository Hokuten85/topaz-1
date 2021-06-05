-----------------------------------
-- Ability: Holy Circle
-- Grants resistance, defense, and attack against Undead to party members within the area of effect.
-- Obtained: Paladin Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.HOLY_CIRCLE_DURATION)
    local subPower = 0
    if (player:getID() ~= target:getID()) then
        subPower = 5
    
        if (player:getMainLvl() > 50) then
            subPower = subPower + math.floor((player:getMainLvl() - 50) / 5);
        end
        
        if player:getSubJob() == xi.job.PLD then
            subPower = math.floor(subPower / 2);
        end
    end
    
    target:addStatusEffect(xi.effect.HOLY_CIRCLE, 15, 0, duration, 0, subPower)
end

return ability_object
