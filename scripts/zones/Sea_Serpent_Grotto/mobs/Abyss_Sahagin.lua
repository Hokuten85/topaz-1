-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Abyss Sahagin
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 20 to 25 minutes
end