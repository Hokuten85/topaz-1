-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Drexerion the Condemned
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 60 to 72 hours
end

return entity
