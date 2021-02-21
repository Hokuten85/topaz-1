-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Abyss Sahagin
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 20 to 25 minutes
end

return entity
