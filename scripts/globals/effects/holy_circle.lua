-----------------------------------
-- xi.effect.HOLY_CIRCLE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
   target:addMod(xi.mod.UNDEAD_KILLER, effect:getPower())
   target:addMod(xi.mod.ENMITY, -effect:getSubPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
   target:delMod(xi.mod.UNDEAD_KILLER, effect:getPower())
   target:delMod(xi.mod.ENMITY, -effect:getSubPower())
end

return effect_object
