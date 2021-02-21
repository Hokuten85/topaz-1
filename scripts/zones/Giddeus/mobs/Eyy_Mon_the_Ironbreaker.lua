-----------------------------------
-- Area: Giddeus (145)
--   NM: Eyy Mon the Ironbreaker
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 15 to 20 minutes
end

return entity
