-----------------------------------
-- Area: Bastok Mines
-- NPC: Disjoined One
-- Made into a Custom Augment NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/status");
require("scripts/globals/disjoined_one_maps");
-----------------------------------
-- onTrade Action
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    handleOnTrade(player,npc,trade)
end

entity.onTrigger = function(player, npc)
    handleOnTrigger(player,npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
