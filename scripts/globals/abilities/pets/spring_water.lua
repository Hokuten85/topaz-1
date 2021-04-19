-----------------------------------
-- Spring Water
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onPetAbility = function(target, pet, skill)
    local base = 47 + pet:getMainLvl()*3
    local tp = skill:getTP()
    if tp < 1000 then
        tp = 1000
    end
    base = base * tp / 1000

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP() --cap it
    end

	local mp = 47 + pet:getMainLvl()*2;
	mp = mp * tp / 1000;
	
	if (target:getMP()+mp > target:getMaxMP()) then
        mp = target:getMaxMP() - target:getMP(); --cap it
    end
    target:delStatusEffect(xi.effect.BLINDNESS)
    target:delStatusEffect(xi.effect.POISON)
    target:delStatusEffect(xi.effect.PARALYSIS)
    target:delStatusEffect(xi.effect.DISEASE)
    target:delStatusEffect(xi.effect.PETRIFICATION)
    target:wakeUp()
    target:delStatusEffect(xi.effect.SILENCE)
    if math.random() > 0.5 then
        target:delStatusEffect(xi.effect.SLOW)
    end
    skill:setMsg(xi.msg.basic.SELF_HEAL)
    target:addHP(base)
    target:addMP(mp)
    return base
end

return ability_object
