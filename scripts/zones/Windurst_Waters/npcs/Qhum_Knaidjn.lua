-----------------------------------
-- Area: Windurst Waters
--  NPC: Qhum_Knaidjn
-- Type: Guildworker's Union Representative
-- !pos -112.561 -2 55.205 238
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Windurst_Waters/IDs")

local keyitems = {
    [0] = {
        id = tpz.ki.RAW_FISH_HANDLING,
        rank = 3,
        cost = 1
    },
    [1] = {
        id = tpz.ki.NOODLE_KNEADING,
        rank = 3,
        cost = 1
    },
    [2] = {
        id = tpz.ki.PATISSIER,
        rank = 3,
        cost = 1
    },
    [3] = {
        id = tpz.ki.STEWPOT_MASTERY,
        rank = 3,
        cost = 1
    },
    [4] = {
        id = tpz.ki.WAY_OF_THE_CULINARIAN,
        rank = 9,
        cost = 1
    }
}

local items = {
    [0] = {
        id = 15451, -- Culinarian's Belt
        rank = 4,
        cost = 1
    },
    [1] = {
        id = 13948, -- Chef's Hat
        rank = 5,
        cost = 1
    },
    [2] = {
        id = 14399, -- Culinarian's Apron
        rank = 7,
        cost = 1
    },
    [3] = {
        id = 137, -- Cordon Bleu Cooking Set
        rank = 9,
        cost = 1
    },
    [4] = {
        id = 338, -- Culinarian's Signboard
        rank = 9,
        cost = 1
    },
    [5] = {
        id = 15826, -- Chef's Ring
        rank = 1,
        cost = 1
    },
    [6] = {
        id = 3667, -- Brass Crock
        rank = 7,
        cost = 1
    },
    [7] = {
        id = 3328, -- Culinarian's Emblem
        rank = 9,
        cost = 1
    }
}

function onTrade(player, npc, trade)
    unionRepresentativeTrade(player, npc, trade, 10025, 8)
end

function onTrigger(player, npc)
    unionRepresentativeTrigger(player, 8, 10024, "guild_cooking", keyitems)
end

function onEventUpdate(player, csid, option, target)
    if (csid == 10024) then
        unionRepresentativeTriggerFinish(player, option, target, 8, "guild_cooking", keyitems, items)
    end
end

function onEventFinish(player, csid, option, target)
    if (csid == 10024) then
        unionRepresentativeTriggerFinish(player, option, target, 8, "guild_cooking", keyitems, items)
    elseif (csid == 10025) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end
