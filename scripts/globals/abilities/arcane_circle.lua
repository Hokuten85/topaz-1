-----------------------------------
-- Ability: Arcane Circle
-- Grants resistance, defense, and attack against Arcana to party members within the area of effect.
-- Obtained: Dark Knight Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.ARCANE_CIRCLE_DURATION)
    
    if (player:getID() ~= target:getID()) then
        local subPower = 5;
    
        if (player:getMainLvl() > 50) then
            subPower = subPower + math.floor((player:getMainLvl() - 50) / 5);
        end
        
        if player:getSubJob() == xi.job.DRK then
            subPower = math.floor(subPower / 2);
        end
        
        target:addStatusEffect(xi.effect.ARCANE_CIRCLE,15,0,duration,0,subPower)
    else
        target:addStatusEffect(xi.effect.ARCANE_CIRCLE,15,0,duration);
    end
end

return ability_object
