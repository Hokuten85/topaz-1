-----------------------------------------
-- ID: 15485
-- Item: Talisman Cape
-- Item Effect: Enchantment MP+12 Enmity-2
-----------------------------------------
require("scripts/globals/msg")
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15485 then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end
    return 0
end

item_object.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end
    
    target:addStatusEffect(xi.effect.ENCHANTMENT,0,0,1800,15485)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 12)
    target:addMod(xi.mod.ENMITY, -2)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 12)
    target:delMod(xi.mod.ENMITY, -2)
end

return item_object
