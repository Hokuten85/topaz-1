-----------------------------------
--  ID: 4265
--  Item: Black Drop
--  Transports the user to their Home Point
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.MAX_HP_BOOST, 5, 0, 900)
    target:addStatusEffect(tpz.effect.MAX_MP_BOOST, 5, 0, 900)
    target:addStatusEffect(tpz.effect.MEDICINE, 0, 0, 3600)
    
    if target:getCharMod(tpz.mod.HP) < 60 then
        target:addCharMod(tpz.mod.HP,3)
    end
    if target:getCharMod(tpz.mod.MP) < 40 then
        target:addCharMod(tpz.mod.MP,2)
    end
    
end

return item_object
