-----------------------------------
-- Area: Toraimarai Canal
--   NM: Oni Carcass
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 21 to 24 hours
end
