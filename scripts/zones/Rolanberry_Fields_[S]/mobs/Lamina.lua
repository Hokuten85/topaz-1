-----------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Lamina
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 510)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 90 to 120 minutes
end

return entity
