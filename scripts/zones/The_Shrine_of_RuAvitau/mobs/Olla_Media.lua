-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Olla Media
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if (isKiller) then
        SpawnMob(mob:getID() + 1):updateClaim(player)
    end
end

entity.onMobDespawn = function(mob)
    if (not GetMobByID(mob:getID() + 1):isSpawned()) then -- if this Media despawns and Grande is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(ID.npc.OLLAS_QM):updateNPCHideTime(xi.settings.FORCE_SPAWN_QM_RESET_TIME)
    end
end

return entity
