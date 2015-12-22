-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Furies
-- BCNM20
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
    GetMobByID(17350929):updateEnmity(target);
    GetMobByID(17350930):updateEnmity(target);
    GetMobByID(17350931):updateEnmity(target);
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)
end;
