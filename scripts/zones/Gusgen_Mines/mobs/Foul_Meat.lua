-----------------------------------
-- Area: Gusgen Mines
--  Mob: Foul Meat
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 18 to 24 hours
end
