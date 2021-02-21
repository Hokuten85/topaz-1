-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Ash Dragon
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(tpz.title.DRAGON_ASHER)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 3 to 5 days
end

return entity
