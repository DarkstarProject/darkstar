-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Olla Media
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
	SpawnMob(17506669,180):updateEnmity(killer);
end;