-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Toadbolster
-- BCNM30
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(17350936):updateEnmity(target);
    GetMobByID(17350937):updateEnmity(target);
    GetMobByID(17350939):updateEnmity(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
