-----------------------------------
-- xi.effect.ARCANE_CIRCLE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
   target:addMod(xi.mod.ARCANA_KILLER, effect:getPower())
   target:addMod(xi.mod.CRITHITRATE, effect:getSubPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
   target:delMod(xi.mod.ARCANA_KILLER, effect:getPower())
   target:delMod(xi.mod.CRITHITRATE, effect:getSubPower())
end

return effect_object
