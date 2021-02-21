-----------------------------------
-- Area: Gustav Tunnel
--   NM: Bune
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)

    -- Set Bune's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)

end

return entity
