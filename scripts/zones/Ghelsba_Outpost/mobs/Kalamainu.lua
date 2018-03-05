-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Kalamainu
-- BCNM30
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    GetMobByID(17350934):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
