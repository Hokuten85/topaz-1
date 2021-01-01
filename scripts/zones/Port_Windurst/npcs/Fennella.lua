-----------------------------------
-- Area: Port Windurst
--  NPC: Fennella
-- Type: Guildworker's Union Representative
-- !pos -177.811 -2.835 65.639 240
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Port_Windurst/IDs")

local keyitems = {
    [0] = {
        id = tpz.ki.FROG_FISHING,
        rank = 3,
        cost = 1
    },
    [1] = {
        id = tpz.ki.SERPENT_RUMORS,
        rank = 8,
        cost = 1
    },
    [2] = {
        id = tpz.ki.MOOCHING,
        rank = 9,
        cost = 1
    },
    [3] = {
        id = tpz.ki.ANGLERS_ALMANAC,
        rank = 9,
        cost = 1
    }
}

local items = {
    [0] = {
        id = 17002, -- Robber's Rig
        rank = 3,
        cost = 1
    },
    [1] = {
        id = 15452, -- Fisherman's Belt
        rank = 4,
        cost = 1
    },
    [2] = {
        id = 14195, -- Pair of Waders
        rank = 5,
        cost = 1
    },
    [3] = {
        id = 14400, -- Fisherman's Apron
        rank = 7,
        cost = 1
    },
    [4] = {
        id = 191, -- Fishing hole map
        rank = 9,
        cost = 1
    },
    [5] = {
        id = 340, -- Fisherman's Signboard
        rank = 9,
        cost = 1
    },
    [6] = {
        id = 3670, -- Fish and Lure
        rank = 7,
        cost = 1
    },
    [7] = {
        id = 3330, -- Fishermen's Emblem
        rank = 9,
        cost = 1
    }
}

function onTrade(player, npc, trade)
    unionRepresentativeTrade(player, npc, trade, 10021, 0)
end

function onTrigger(player, npc)
    unionRepresentativeTrigger(player, 0, 10020, "guild_fishing", keyitems)
end

function onEventUpdate(player, csid, option, target)
    if (csid == 10020) then
        unionRepresentativeTriggerFinish(player, option, target, 0, "guild_Fishing", keyitems, items)
    end
end

function onEventFinish(player, csid, option, target)
    if (csid == 10020) then
        unionRepresentativeTriggerFinish(player, option, target, 0, "guild_Fishing", keyitems, items)
    elseif (csid == 10021) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end
