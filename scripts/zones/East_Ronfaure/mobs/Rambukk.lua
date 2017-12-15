-----------------------------------
-- Area: East Ronfaure
--  MOB: Rambukk
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
