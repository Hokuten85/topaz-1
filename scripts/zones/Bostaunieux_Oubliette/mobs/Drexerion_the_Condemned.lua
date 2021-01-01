-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Drexerion the Condemned
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 60 to 72 hours
end
