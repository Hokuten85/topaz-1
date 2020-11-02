-----------------------------------
-- Area: La Vaule [S]
--   NM: All-seeing Onyx Eye
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end
