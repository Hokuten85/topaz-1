-----------------------------------
-- Area: La Theine Plateau
--  NPC: Balamor
-- Type: Mob Bounty
-- !pos 449 24 4 194
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
local ID = require("scripts/zones/La_Theine_Plateau/IDs")

function formatName(string)
    return string:gsub("_"," "):gsub("(%a)([%w_']*)", function (a,b) return a:upper()..b:lower() end)
end

local function getIndex (tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return index
        end
    end

    return false
end

local entity = {}

entity.onTrade = function(player, npc, trade)
    local bountyPoints = player:getCharVar("BountyPoints")
    local npcName = npc:getName()
    if trade:getSlotCount() == 1 and bountyPoints >= 10 then
		local tradeGil = trade:getGil()
        if (tradeGil >= 80 and tradeGil <= 91) or (tradeGil >= 101 and tradeGil <= 122) then -- tradeGil amound corresponds to MOD
            local currentModLvl = player:getCharMod(tradeGil)
            if currentModLvl < 20 then
                player:addCharMod(tradeGil,1)
                currentModLvl = currentModLvl +1
                player:setCharVar("BountyPoints", bountyPoints - 10)
                player:PrintToPlayer(string.format("I have raised your %s skill, your bonus is now +%s", getIndex(tpz.mod, tradeGil), currentModLvl), 0, npcName)
            else
                player:PrintToPlayer("I cannot raise your skill any further.", 0, npcName)
            end
        else
            player:PrintToPlayer("stares at you.", 8, npcName)
            npc:timer(1000, player:PrintToPlayer("Not what I asked for.", 0, npcName))
        end
    else
        player:PrintToPlayer("stares at you.", 8, npcName)
    end
end

entity.onTrigger = function(player, npc)
    local bountyPoints = player:getCharVar("BountyPoints")
    local npcName = npc:getName()
    local delay = 0
    if bountyPoints >= 10 then
        local bountyPtsExplained = player:getCharVar("BountyPtsExplained")
        if bountyPtsExplained == 0 then
            player:PrintToPlayer("apraises you.", 8, npcName)
            npc:timer(4000, function() player:PrintToPlayer("Seems your not entirely worthless.", 0, npcName) end)
            npc:timer(5000, function() player:PrintToPlayer("Been killing some Notorious Monsters, huh?", 0, npcName) end)
            npc:timer(6000, function() player:PrintToPlayer("Seems I might be able to help you with your little black market operation you have running.", 0, npcName) end)
            delay = 9000
        
            player:setCharVar("BountyPtsExplained", 1)
        end
        
        npc:timer(delay, function() player:PrintToPlayer("Trade me the required Gil and I'll enhance your skill.", 0, npcName) end)
        npc:timer(delay+1000, function()
            for i = 80, 91 do
                local statIndex = getIndex(tpz.mod, i)
                if statIndex ~= false then
                    player:PrintToPlayer(string.format("    %s: %s", formatName(statIndex), i), 13, npcName)
                end
            end
            for  i = 101, 122 do
                local statIndex = getIndex(tpz.mod, i)
                if statIndex ~= false then
                    player:PrintToPlayer(string.format("    %s: %s", formatName(statIndex), i), 13, npcName)
                end
            end
        end)
    else
        player:PrintToPlayer("stares at you.", 8, npcName)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity


