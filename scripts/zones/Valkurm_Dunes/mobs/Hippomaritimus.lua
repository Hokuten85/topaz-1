-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Hippomaritimus
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 210)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
	mob:setRespawnTime(900) -- 60-90min repop
end
