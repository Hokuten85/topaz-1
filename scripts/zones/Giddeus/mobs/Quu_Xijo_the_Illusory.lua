-----------------------------------
-- Area: Giddeus (145)
--   NM: Quu Xijo the Illusory
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 283)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 60 to 70 minutes
end
