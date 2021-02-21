-----------------------------------
-- Area: Gusgen Mines
--  Mob: Foul Meat
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 18 to 24 hours
end

return entity
