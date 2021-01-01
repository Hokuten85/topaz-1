-----------------------------------
-- Ability: Ancient Circle
-- Grants resistance, defense, and attack against dragons to party members within the area of effect.
-- Obtained: Dragoon Level 5
-- Recast Time: 5:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local duration = 180 + player:getMod(tpz.mod.ANCIENT_CIRCLE_DURATION)
    target:addStatusEffect(tpz.effect.ANCIENT_CIRCLE,15,0,duration)

    if (player:getID() ~= target:getID()) then
        local subPower = math.max(5,player:getTraitValue(TRAIT_ACCURACY_BONUS));
        
        if player:getSubJob() == tpz.job.DRG then
            subPower = math.floor(subPower / 2);
        end
        
        target:addStatusEffect(tpz.effect.ANCIENT_CIRCLE,15,0,duration,0,subPower);
    else
        target:addStatusEffect(tpz.effect.ANCIENT_CIRCLE,15,0,duration);
    end
end