-----------------------------------
-- Area: Palborough Mines
--   NM: No'Mho Crimsonarmor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 21 to 24 hours
end
