-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Olla Pequena
-----------------------------------
require("scripts/globals/settings");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        SpawnMob(mob:getID() + 1):updateClaim(player);
    end
end;

function onMobDespawn(mob)
    if (not GetMobByID(mob:getID() + 1):isSpawned()) then -- if this Pequena despawns and Media is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(OLLAS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
