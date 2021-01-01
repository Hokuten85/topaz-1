-----------------------------------
-- Area: Ghelsba Outpost (140)
--  Mob: Orcish Wallbreacher
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 169)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 65 to 90 min
end
