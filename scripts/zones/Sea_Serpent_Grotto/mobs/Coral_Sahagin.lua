-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Coral Sahagin
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 20 to 45 minutes
end