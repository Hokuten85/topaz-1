-----------------------------------
-- Area: Mamook
--   NM: Dragonscaled Bugaal Ja
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 28 to 72 hours
end

return entity
