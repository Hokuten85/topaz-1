-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 3 to 5 days
end
