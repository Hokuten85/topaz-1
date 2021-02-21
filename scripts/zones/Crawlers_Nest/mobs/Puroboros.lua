-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Puroboros
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 1 to 3 hours
end

return entity
