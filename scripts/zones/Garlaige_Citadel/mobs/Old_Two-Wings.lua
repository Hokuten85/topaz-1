-----------------------------------
-- Area: Garlaige Citadel (200)
--   NM: Old Two-Wings
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)

    -- Set Old_Two_Wings's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)

end

return entity
