-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Balamor
-- Type: Mob Bounty
-- !pos 113 40 370 125
-----------------------------------

function onTrade(player,npc,trade)
	local bountyBuyIn = player:getCharVar("BountyBuyIn")
	if (trade:getSlotCount() == 1) then
		local tradeGil = trade:getGil();
		if (tradeGil == 10000) then
			if bountyBuyIn ~= 1 then
				player:setCharVar("BountyBuyIn", 1)
				player:PrintToPlayer("Glad to have you! Truth is my whole crew died on the last job. Quite the unfortunate bloodbath...", 0, npc:getName())
				player:PrintToPlayer("stares off into the distance...", 8, npc:getName())
				player:PrintToPlayer("Anyway...that's not important. We work with mostly...", 0, npc:getName())
				player:PrintToPlayer("coughs.", 8, npc:getName())
				player:PrintToPlayer("black market", 0, npc:getName())
				player:PrintToPlayer("coughs.", 8, npc:getName())
				player:PrintToPlayer("...goods transfer, so discretion is of the utmost importance.", 0, npc:getName())
			else
		
			end
			
			local client = GetServerVariable("BountyClient")
			if not client then
				local cities = {"San d'Oria", "Windurst", "Bastok", "Jeuno", "Selbina", "Mhaura", "Kazham", "Norg", "Aht Urgan", "Tavnazia"}
				client = cities[math.random(10)]
				SetServerVariable("BountyClient", client)
			end
			
			player:PrintToPlayer(string.format("I have a client from %s who's having issues with a nasty Notorious Monster that keeps interrupting their supply route.", client), 0, npc:getName())
			
			local bountyMobId, bountyItemId = player:getBountyMob(1)
			local mob = GetMobByID(bountyMobId)
			local item = GetItemByID(bountyItemId)
			player:PrintToPlayer("Your job is to go find %s and kill it.", 0, npc:getName())
		end
	end

end

function onTrigger(player,npc)
	local bountyBuyIn = player:getCharVar("BountyBuyIn")
	local bountyType = player:getCharVar("BountyType")
	local bountyMobId = player:getCharVar("BountyMobId")
	local bountyItemId = player:getCharVar("BountyItemId")

	if bountyBuyIn == 1 then
		if bountyType and bountyMobId then
		
		elseif bountyItemId then
			
		else
			
		end
	else
		player:PrintToPlayer("Hey, you look like you've survived a few beatings, want in on my little operation?", 0, npc:getName())
		player:PrintToPlayer("I provide discreet caravan security services for select clientele across Vana'diel. Just so happens that I'm looking for some new muscle for my crew.", 0, npc:getName())
		player:PrintToPlayer("Due to the hush hush nature of the job, I require each member of my crew to put down 10000 Gil as collateral.", 0, npc:getName())
		player:PrintToPlayer("Don't worry, you'll make it back and then some when the job is over. What do you say? Toss me 10000 Gil and we are in business.", 0, npc:getName())
	end

	

	-- local bountyMobId, bountyItemId = player:getBountyMob(1)
	
	-- player:PrintToPlayer(bountyMobId)
	-- player:PrintToPlayer(bountyItemId)
	
	-- local mob = GetMobByID(bountyMobId)
	-- local item = GetItemByID(bountyItemId)
	
	-- local itemName = item:getName():gsub("_"," "):gsub("(%a)([%w_']*)", function (a,b) return a:upper()..b:lower() end)
	
	-- player:PrintToPlayer(mob:getName():gsub("_"," "), 0, npc:getName())
	-- player:PrintToPlayer(itemName, 0, npc:getName())
	-- local bountyType = player:getCharVar("BountyType")
	-- local bountyMobId = player:getCharVar("BountyMob")
	-- local bountyItemId = player:getCharVar("BountyItem")
	
	-- if bountyType and bountyMob then
		-- player:PrintToPlayer("What do you want? You already have a job.", 0, npc:getName())
		-- local mob = GetMobByID(bountyMobId)
	-- else
	
	-- end
	
-- player:PrintToPlayer("Sup", 0, npc:getName())
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
