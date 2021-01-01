-----------------------------------
-- Area: Bastok Mines
-- NPC: Disjoined One
-- Made into a Custom Augment NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs");
require("scripts/globals/status");
require("scripts/globals/disjoined_one_maps");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	handleOnTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	handleOnTrigger(player,npc)
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
