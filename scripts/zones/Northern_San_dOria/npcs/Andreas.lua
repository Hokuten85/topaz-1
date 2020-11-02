-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Andreas
-- Type: Guildworker's Union Representative
-- !pos -189.282 10.999 262.626 231
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Northern_San_dOria/IDs")

local keyitems = {
    [0] = {
        id = tpz.ki.WOOD_PURIFICATION,
        rank = 3,
        cost = 1
    },
    [1] = {
        id = tpz.ki.WOOD_ENSORCELLMENT,
        rank = 3,
        cost = 1
    },
    [2] = {
        id = tpz.ki.LUMBERJACK,
        rank = 3,
        cost = 1
    },
    [3] = {
        id = tpz.ki.BOLTMAKER,
        rank = 3,
        cost = 1
    },
    [4] = {
        id = tpz.ki.WAY_OF_THE_CARPENTER,
        rank = 9,
        cost = 1
    }
}

local items = {
    [0] = {
        id = 15444, -- Carpenter's Belt
        rank = 1,
        cost = 1
    },
    [1] = {
        id = 14830, -- Carpenter's Gloves
        rank = 5,
        cost = 1
    },
    [2] = {
        id = 14392, -- Carpenter's Apron
        rank = 7,
        cost = 1
    },
    [3] = {
        id = 28, -- Drawing Desk
        rank = 9,
        cost = 1
    },
    [4] = {
        id = 341, -- Carpenter's Signboard
        rank = 9,
        cost = 1
    },
    [5] = {
        id = 15819, -- Carpenter's Ring
        rank = 1,
        cost = 1
    },
    [6] = {
        id = 3672, -- Carpenter's Kit
        rank = 8,
        cost = 1
    },
    [7] = {
        id = 3331, -- Carpenter's Emblem
        rank = 9,
        cost = 1
    }
}

function onTrade(player, npc, trade)
    unionRepresentativeTrade(player, npc, trade, 732, 1)
end

function onTrigger(player, npc)
    unionRepresentativeTrigger(player, 1, 731, "guild_woodworking", keyitems)
end

function onEventUpdate(player, csid, option, target)
    if (csid == 731) then
        unionRepresentativeTriggerFinish(player, option, target, 1, "guild_woodworking", keyitems, items)
    end
end

function onEventFinish(player, csid, option, target)
    if (csid == 731) then
        unionRepresentativeTriggerFinish(player, option, target, 1, "guild_woodworking", keyitems, items)
    elseif (csid == 732) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end
