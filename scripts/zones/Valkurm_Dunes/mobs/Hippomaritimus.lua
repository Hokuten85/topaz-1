-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Hippomaritimus
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 210)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
	mob:setRespawnTime(900) -- 60-90min repop
end

return entity
