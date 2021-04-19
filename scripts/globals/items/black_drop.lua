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
    if (target:hasStatusEffect(xi.effect.MEDICINE)) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.MAX_HP_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MAX_MP_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)
    
    if target:getCharMod(xi.mod.HP) < 60 then
        target:addCharMod(xi.mod.HP,3)
    end
    if target:getCharMod(xi.mod.MP) < 40 then
        target:addCharMod(xi.mod.MP,2)
    end
    
end

return item_object
