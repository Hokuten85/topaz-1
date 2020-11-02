-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Habrok
-----------------------------------
require("scripts/globals/hunts")
require("scripts/quests/tutorial")

function onMobInitialize(mob)
    mob:setLocalVar("pop", os.time() + 900)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 258)
    tpz.tutorial.onMobDeath(player)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setLocalVar("pop", os.time() + 900)
end
