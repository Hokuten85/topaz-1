-----------------------------------
-- Area: Ve'Lugannon Palace
--   NM: Steam Cleaner
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end

return entity
