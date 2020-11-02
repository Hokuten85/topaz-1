-----------------------------------------
-- ID: 15485
-- Item: Talisman Cape
-- Item Effect: Enchantment MP+12 Enmity-2
-----------------------------------------
require("scripts/globals/msg")

function onItemCheck(target)
    local effect = target:getStatusEffect(tpz.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15485 then
        target:delStatusEffect(tpz.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(tpz.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(tpz.effect.ENCHANTMENT)
    end
    
    target:addStatusEffect(tpz.effect.ENCHANTMENT,0,0,1800,15485)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.MP, 12)
    target:addMod(tpz.mod.ENMITY, -2)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MP, 12)
    target:delMod(tpz.mod.ENMITY, -2)
end