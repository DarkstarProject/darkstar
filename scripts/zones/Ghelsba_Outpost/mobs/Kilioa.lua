-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Kilioa
-- BCNM30
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(17350933):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
