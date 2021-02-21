-----------------------------------
-- Area: Phomiuna_Aqueducts
--   NM: Mahisha
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar("fomorHateAdj", -1)
end

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(900) -- 8 to 12 hours
end

return entity
