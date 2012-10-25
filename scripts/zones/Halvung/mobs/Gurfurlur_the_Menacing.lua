-----------------------------------
-- Area: Halvung
-- NPC:  Gurfurlur the Menacing
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
	
	SpawnMob(17031593,180):updateEnmity(target);
	SpawnMob(17031594,180):updateEnmity(target);
	SpawnMob(17031595,180):updateEnmity(target);
	SpawnMob(17031596,180):updateEnmity(target);
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TROLL_SUBJUGATOR);
end;