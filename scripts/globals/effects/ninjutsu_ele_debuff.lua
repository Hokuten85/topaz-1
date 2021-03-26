-----------------------------------
-- Ninjutsu Elemental Debuff
-- Reduces a targets given elemental resistance
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(effect:getSubPower(), -effect:getPower())
    target:addMod(effect:getSubPower()-39, -effect:getPower()/2) -- resistMod - 39 = defenseMod
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(effect:getSubPower(), -effect:getPower())
    target:delMod(effect:getSubPower()-39, -effect:getPower()/2)
end

return effect_object
