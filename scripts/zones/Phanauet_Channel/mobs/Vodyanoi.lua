-----------------------------------
-- Area: Phanauet Channel (1)
--   NM: Vodyanoi
-- !pos -2.0 -3.0 9.6 1
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 12 - 15 hours
end

return entity
