-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Furies
-- BCNM20
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

function onMobEngaged(mob,target)
    GetMobByID(17350929):updateEnmity(target);
    GetMobByID(17350930):updateEnmity(target);
    GetMobByID(17350931):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;
