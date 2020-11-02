-----------------------------------
-- Area: La Vaule [S]
--   NM: Cogtooth Skagnogg
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end
