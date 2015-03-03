-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Olla Pequena
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
	SpawnMob(17506668,180):updateEnmity(killer);
end;