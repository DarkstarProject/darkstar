-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Colo-colo
-- BCNM20
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(17350930):updateEnmity(target);
    GetMobByID(17350931):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
