-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Duke Haborym
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)

    -- Set Duke_Haborym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)

end

return entity
