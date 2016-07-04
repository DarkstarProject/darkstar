-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Toadpillow
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
    GetMobByID(17350937):updateEnmity(target);
    GetMobByID(17350938):updateEnmity(target);
    GetMobByID(17350939):updateEnmity(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
