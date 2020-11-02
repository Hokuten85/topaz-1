-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Faust
-----------------------------------
-- TODO: Faust should WS ~3 times in a row each time.

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
	mob:setRespawnTime(900) -- respawn 3-6 hrs
end
