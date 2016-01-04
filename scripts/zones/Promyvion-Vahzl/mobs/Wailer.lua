-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Wailer
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(16867688):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;