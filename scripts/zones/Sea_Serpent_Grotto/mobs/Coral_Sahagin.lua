-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Coral Sahagin
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 20 to 45 minutes
end

return entity
