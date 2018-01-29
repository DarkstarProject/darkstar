-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Toadbolster
-- BCNM30
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(17350936):updateEnmity(target);
    GetMobByID(17350937):updateEnmity(target);
    GetMobByID(17350939):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
