-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Ash Dragon
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.DRAGON_ASHER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());	
    mob:setRespawnTime(900);
end;
