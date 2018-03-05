-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Toadcushion
-- BCNM30
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(17350936):updateEnmity(target);
    GetMobByID(17350937):updateEnmity(target);
    GetMobByID(17350938):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
