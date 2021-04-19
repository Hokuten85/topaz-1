-----------------------------------
-- Area: Ranguemont Pass
--   NM: Mucoid Mass
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 345)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 90 to 100 minutes
end

return entity
