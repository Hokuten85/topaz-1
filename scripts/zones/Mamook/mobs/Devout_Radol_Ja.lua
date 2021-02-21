-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 3 to 5 days
end

return entity
