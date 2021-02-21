-----------------------------------
-- Area: Gusgen Mines
--   NM: Juggler Hecatomb
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 21 to 24 hours
end


return entity
