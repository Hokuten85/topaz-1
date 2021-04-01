-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Balamor
-- Type: Mob Bounty
-- !pos 113 40 370 125
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")

function formatName(string)
    return string:gsub("_"," "):gsub("(%a)([%w_']*)", function (a,b) return a:upper()..b:lower() end)
end

function clearBountyVars(player)
    player:setCharVar("BountyType", 0)
	player:setCharVar("BountyMobId", 0)
	player:setCharVar("BountyItemId", 0)
    player:setCharVar("BountyMobExpireTime", 0)
    player:setCharVar("BountySuccess", 0)
end

local entity = {}

entity.onTrade = function(player, npc, trade)
    local bountyBuyIn = player:getCharVar("BountyBuyIn")
    local bountyMobId = player:getCharVar("BountyMobId")
    local bountySuccess = player:getCharVar("BountySuccess")
    local bountyMobExpireTime = player:getCharVar("BountyMobExpireTime")
    local npcName = npc:getName()

    if (bountySuccess == 0 and bountyMobId ~= 0 and bountyMobExpireTime > 0 and bountyMobExpireTime <= os.clock()) then
        player:PrintToPlayer("stares at you angrily...", 8, npcName)
        player:PrintToPlayer("Client's pissed.", 0, npcName)
        player:PrintToPlayer("is visibly becoming irate...", 8, npcName)
        player:PrintToPlayer("Job failed.", 1, npcName)
        player:PrintToPlayer("yelling echos through the canyon.", 8, npcName)
        player:PrintToPlayer("What do you think this is?! WHAT KIND OF PEOPLE DO YOU THINK WE WORK FOR?!!!", 26, npcName)
        player:PrintToPlayer("regains his composure and continues in a hushed whisper...", 8, npcName)
        player:PrintToPlayer("You do not fail these people if you value your life.", 1, npcName)
        player:PrintToPlayer(string.format("Not acceptable %s, your collateral is forfeit. You must do better next time.", playerName), 0, npcName)
        
        clearBountyVars(player)
        return
    end
    
	if (trade:getSlotCount() == 1) then
		local tradeGil = trade:getGil()
        if tradeGil > 0 and bountyMobId ~= 0 then
            local mob = GetMobByID(bountyMobId)
            player:PrintToPlayer(string.format("You've already got a job. Can't give ya another until you take care of %s.", formatName(mob:getName())), 0, npcName)
            return
        end
        
        local bountyItemId = player:getCharVar("BountyItemId")
        if (bountyItemId ~= 0 and bountySuccess == 1 and bountyMobExpireTime >= os.clock() and trade:hasItemQty(bountyItemId, 1) and trade:getItemCount() == 1) then
            local item = GetReadOnlyItem(bountyItemId)
            local bountyType = player:getCharVar("BountyType")
            player:PrintToPlayer(string.format("You've brought me a %s! As promised, here's your reward.", formatName(item:getName())), 0, npcName)
            
            local bountyPoints = 1
            local gilReward = 10000
            if bountyType == 2 then
                bountyPoints = 5
                gilReward = 100000
            elseif bountyType == 3 then
                bountyPoints = 10
                gilReward = 500000
            end
            
            player:setCharVar("BountyPoints", player:getCharVar("BountyPoints") + bountyPoints)
            player:addGil(gilReward * 10)
            player:messageSpecial(ID.text.GIL_OBTAINED, gilReward * 10)
            
            player:setCharVar("BountyItemId", 0)
            player:tradeComplete()
            return
        end
        
		if tradeGil == 10000 then
			if bountyBuyIn < 1 then
				player:setCharVar("BountyBuyIn", 1)
				player:PrintToPlayer("Glad to have you! Truth is my whole crew died on the last job. Quite the unfortunate bloodbath...", 0, npcName)
				player:PrintToPlayer("stares off into the distance...", 8, npcName)
				player:PrintToPlayer("Anyway...that's not important. We work with mostly...", 0, npcName)
				player:PrintToPlayer("coughs.", 8, npcName)
				player:PrintToPlayer("black market", 0, npcName)
				player:PrintToPlayer("coughs.", 8, npcName)
				player:PrintToPlayer("...goods transfer, so discretion is of the utmost importance.", 0, npcName)
			end
            
			local cities = {"San d'Oria", "Windurst", "Bastok", "Jeuno", "Selbina", "Mhaura", "Kazham", "Norg", "Aht Urgan", "Tavnazia"}
			local client = cities[math.random(10)]
			
			local bountyMobId, bountyItemId = player:getBountyMob(1)
            player:setCharVar("BountyMobId", bountyMobId)
            player:setCharVar("BountyItemId", bountyItemId)
            player:setCharVar("BountyType", 1)
            player:setCharVar("BountySuccess", 0)
            
			local mob = GetMobByID(bountyMobId)
			local item = GetReadOnlyItem(bountyItemId)
            local prettyMobName = formatName(mob:getName())
            
            player:PrintToPlayer(string.format("I have a client from %s who's having issues with a nasty Notorious Monster that keeps interrupting their supply route.", client), 0, npcName)
			player:PrintToPlayer(string.format("Your job is to go find %s, kill it, and return here for your reward.", prettyMobName), 0, npcName)
            player:PrintToPlayer(string.format("If %s happens to drop a %s, I'll take that too. Client says they'll pay extra.", prettyMobName, formatName(item:getName())), 0, npcName)
            player:PrintToPlayer("This isn't no leisurely job neither. We have one week or the contract expires and I keep your collateral. Get movin'.", 0, npcName)

            player:setCharVar("BountyMobExpireTime", os.time() + 604800)
            player:tradeComplete()
        elseif tradeGil == 100000 and bountyBuyIn == 2 then
            local bountyMobId, bountyItemId = player:getBountyMob(2)
            player:setCharVar("BountyMobId", bountyMobId)
            player:setCharVar("BountyItemId", bountyItemId)
            player:setCharVar("BountyType", 2)
            player:setCharVar("BountySuccess", 0)
            
			local mob = GetMobByID(bountyMobId)
			local item = GetReadOnlyItem(bountyItemId)
            local prettyMobName = formatName(mob:getName())
            
            player:PrintToPlayer(string.format("You know the drill, your job is to go find %s, kill it, and return here for your reward.", prettyMobName), 0, npcName)
            player:PrintToPlayer(string.format("If %s happens to drop a %s, I'll take that too. Client will pay extra.", prettyMobName, formatName(item:getName())), 0, npcName)
            player:PrintToPlayer("One week.", 0, npcName)
            
            player:setCharVar("BountyMobExpireTime", os.time() + 604800)
            player:tradeComplete()
        elseif tradeGil == 500000 and bountyBuyIn == 2 then
            local bountyMobId, bountyItemId = player:getBountyMob(3)
            player:setCharVar("BountyMobId", bountyMobId)
            player:setCharVar("BountyItemId", bountyItemId)
            player:setCharVar("BountyType", 3)
            player:setCharVar("BountySuccess", 0)
            
			local mob = GetMobByID(bountyMobId)
			local item = GetReadOnlyItem(bountyItemId)
            local prettyMobName = formatName(mob:getName())
            
            player:PrintToPlayer("This is the most dangerous job I have on the books. You sure you want this? I already have your money, no turning back now.", 0, npcName)
            player:PrintToPlayer(string.format("%s.", prettyMobName), 0, npcName)
            player:PrintToPlayer(string.format("Just hearing that name scares the piss out of me. %s, I'm trusting you. There's a lot of Gil riding on this.", player:getName()), 0, npcName)
            player:PrintToPlayer("I've worked out a secondary deal with one of my other clients.", 0, npcName)
            player:PrintToPlayer(string.format("They want %s's %s. Will pay handsomely for it too. Bring that to me if you survive.", prettyMobName, formatName(item:getName())), 0, npcName)
            player:PrintToPlayer("You have one week, starting now.", 0, npcName)
            
            player:setCharVar("BountyMobExpireTime", os.time() + 604800)
            player:tradeComplete()
		end
	end
end

entity.onTrigger = function(player, npc)
    local bountyMobExpireTime = player:getCharVar("BountyMobExpireTime")
    local bountyMobId = player:getCharVar("BountyMobId")
    local bountySuccess = player:getCharVar("BountySuccess")
    local npcName = npc:getName()
    local playerName = player:getName()
    
    if (bountySuccess == 0 and bountyMobId ~= 0 and bountyMobExpireTime > 0 and bountyMobExpireTime <= os.clock()) then
        player:PrintToPlayer("stares at you angrily...", 8, npcName)
        player:PrintToPlayer("Client's pissed.", 0, npcName)
        player:PrintToPlayer("is visibly becoming irate...", 8, npcName)
        player:PrintToPlayer("Job failed.", 1, npcName)
        player:PrintToPlayer("yelling echos through the canyon, with fear and panic stricken across his face.", 8, npcName)
        player:PrintToPlayer("What do you think this is?! WHAT KIND OF PEOPLE DO YOU THINK WE WORK FOR?!!!", 26, npcName)
        player:PrintToPlayer("regains his composure and continues in a hushed whisper...", 8, npcName)
        player:PrintToPlayer("If you value your life, you cannot fail these people.", 0, npcName)
        player:PrintToPlayer(string.format("Not acceptable %s, your collateral is forfeit. You must do better next time.", playerName), 0, npcName)
        
        clearBountyVars(player)
        return
    end
	
	local bountyItemId = player:getCharVar("BountyItemId")
    local item = GetReadOnlyItem(bountyItemId)
    
    if bountyMobId ~= 0 then
        if bountySuccess == 1 then -- Killed bounty mob
            local bountyType = player:getCharVar("BountyType")
            player:PrintToPlayer("You've done it! As promised, here's your reward.", 0, npcName)
            
            local bountyPoints = 1
            local gilReward = 10000
            if bountyType == 2 then
                bountyPoints = 5
                gilReward = 100000
            elseif bountyType == 3 then
                bountyPoints = 10
                gilReward = 500000
            end
            
            player:setCharVar("BountyPoints", player:getCharVar("BountyPoints") + bountyPoints)
            player:addGil(gilReward * 10)
            player:messageSpecial(ID.text.GIL_OBTAINED, gilReward * 10)
            
            player:setCharVar("BountyMobId", 0)
        else
            local mob = GetMobByID(bountyMobId)
            player:PrintToPlayer(string.format("You've already got a job. Can't give ya another until you take care of %s.", formatName(mob:getName())), 0, npcName)
            player:PrintToPlayer(string.format("Don't forget the %s if it drops.", formatName(item:getName())), 0, npcName)
        end
        return
    elseif bountyItemId ~= 0 then
        player:PrintToPlayer(string.format("Still looking for a %s. Get me one before you take your next job if you still want the added reward.", formatName(item:getName())), 0, npcName)
    end
    
    local bountyBuyIn = player:getCharVar("BountyBuyIn")

    if bountyBuyIn == 2 and player:getMainLvl() >= 70 then
        player:PrintToPlayer("I got three jobs at varying probabilities of death.", 0, npcName)
        player:PrintToPlayer("You know how this works, what you're willing to risk determines the job I give you. 10000, 100000, or 500000 Gil.", 0, npcName)
	elseif bountyBuyIn >= 1 then
        if bountyBuyIn == 1 and player:getMainLvl() >= 70 then
            player:PrintToPlayer(string.format("%s, I do believe it is time. I rarely give out such dangerous jobs, ", playerName), 0, npcName)
            player:PrintToPlayer("but it appears that your strength has grown to rival the best this world has to offer.", 13, npcName)
            player:PrintToPlayer("I'm putting my repuation on the line for this, and I require that you have some additional skin in the game before I say anything more.", 0, npcName)
            player:PrintToPlayer("100000 Gil gets your foot in the door into this more dangerous line of work, but if you really want to prove yourself...", 0, npcName)
            player:PrintToPlayer("If you really believe you have the mettle to challenge the most fierce fiends in our world. 500000 Gil.", 0, npcName)
            player:setCharVar("BountyBuyIn", 2)
		else
            player:PrintToPlayer(string.format("Welcome back %s. Looking for work? I got a job if you've got the 10000 Gil collateral.", playerName), 0, npcName)
		end
	else
		player:PrintToPlayer("Hey, you look like you've survived a few beatings, want in on my little operation?", 0, npcName)
		player:PrintToPlayer("I provide discreet caravan security services for select clientele across Vana'diel. Just so happens that I'm looking for some new muscle for my crew.", 0, npcName)
		player:PrintToPlayer("Due to the hush hush nature of the job, I require each member of my crew to put down 10000 Gil as collateral.", 0, npcName)
		player:PrintToPlayer("Don't worry, you'll make it back and then some when the job is over. What do you say? Toss me 10000 Gil and we are in business.", 0, npcName)
	end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity


