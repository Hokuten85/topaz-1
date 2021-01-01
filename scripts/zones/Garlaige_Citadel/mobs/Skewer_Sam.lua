-----------------------------------
-- Area: Garlaige Citadel (200)
--   NM: Skewer Sam
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 21 to 24 hours
end
