-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Temple Guardian
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    GetNPCByID(17428978):openDoor(300); -- 5min
end;