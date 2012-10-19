-----------------------------------
-- Area: Mamook
-- NPC:  Gulool Ja Ja
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
	
	SpawnMob(17043876,180):updateEnmity(target);
	SpawnMob(17043877,180):updateEnmity(target);
	SpawnMob(17043878,180):updateEnmity(target);
	SpawnMob(17043879,180):updateEnmity(target);
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(SHINING_SCALE_RIFLER);
end;