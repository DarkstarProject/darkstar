-----------------------------------
-- Area: Al'Taieu
-- NPC:  Jailer of Love
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    SpawnMob(16912876,180):updateEnmity(killer);
end;