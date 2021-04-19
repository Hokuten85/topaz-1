-----------------------------------
-- Area: Bastok Mines
--  NPC: Hemewmew
-- Type: Guildworker's Union Representative
-- !pos 117.970 1.017 -10.438 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
-----------------------------------
local entity = {}

local keyitems = {
    [0] = {
        id = xi.ki.ANIMA_SYNTHESIS,
        rank = 3,
        cost = 1
    },
    [1] = {
        id = xi.ki.ALCHEMIC_PURIFICATION,
        rank = 3,
        cost = 1
    },
    [2] = {
        id = xi.ki.ALCHEMIC_ENSORCELLMENT,
        rank = 3,
        cost = 1
    },
    [3] = {
        id = xi.ki.TRITURATION,
        rank = 3,
        cost = 1
    },
    [4] = {
        id = xi.ki.CONCOCTION,
        rank = 3,
        cost = 1
    },
    [5] = {
        id = xi.ki.IATROCHEMISTRY,
        rank = 3,
        cost = 1
    },
    [6] = {
        id = xi.ki.WAY_OF_THE_ALCHEMIST,
        rank = 9,
        cost = 1
    }
}

local items = {
    [0] = {
        id = 15450, -- Alchemist's Belt
        rank = 4,
        cost = 1
    },
    [1] = {
        id = 17058, -- Caduceus
        rank = 5,
        cost = 1
    },
    [2] = {
        id = 14398, -- Alchemist's Apron
        rank = 7,
        cost = 1
    },
    [3] = {
        id = 134, -- copy of Emeralda
        rank = 9,
        cost = 1
    },
    [4] = {
        id = 342, -- Alchemist's Signboard
        rank = 9,
        cost = 1
    },
    [5] = {
        id = 15825, -- Alchemist's Ring
        rank = 1,
        cost = 1
    },
    [6] = {
        id = 3674, -- Alembic
        rank = 7,
        cost = 1
    },
    [7] = {
        id = 3332, -- Alchemist's Emblem
        rank = 9,
        cost = 1
    }
}

entity.onTrade = function(player, npc, trade)
    unionRepresentativeTrade(player, npc, trade, 207, 7)
end

entity.onTrigger = function(player, npc)
    unionRepresentativeTrigger(player, 7, 206, "guild_alchemy", keyitems)
end

entity.onEventUpdate = function(player, csid, option, target)
    if (csid == 206) then
        unionRepresentativeTriggerFinish(player, option, target, 7, "guild_alchemy", keyitems, items)
    end
end

entity.onEventFinish = function(player, csid, option, target)
    if (csid == 206) then
        unionRepresentativeTriggerFinish(player, option, target, 7, "guild_alchemy", keyitems, items)
    elseif (csid == 207) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
