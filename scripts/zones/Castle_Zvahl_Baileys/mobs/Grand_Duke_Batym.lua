-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Grand Duke Batym
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    -- Set Grand_Duke_Batym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)
end

return entity
