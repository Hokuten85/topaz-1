-----------------------------------
-- Area: Fort Ghelsba
--  Mob: Orcish Fighter
-----------------------------------
local ID = require("scripts/zones/Fort_Ghelsba/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if (mob:getID() == (ID.mob.ORCISH_PANZER + 1)) then
        DisallowRespawn(ID.mob.ORCISH_PANZER, false)
        GetMobByID(ID.mob.ORCISH_PANZER):setRespawnTime(900) -- 60 to 70 min
    end
end
