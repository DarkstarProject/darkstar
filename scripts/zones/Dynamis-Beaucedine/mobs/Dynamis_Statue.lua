-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Statue
-- Trigger for Poison Pukis respawn
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326458):updateEnmity(target);
	GetMobByID(17326458):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326446):updateEnmity(target);
	GetMobByID(17326446):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326374):updateEnmity(target);
	GetMobByID(17326374):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326415):updateEnmity(target);
	GetMobByID(17326415):setMobMod(MOBMOD_MAIN_2HOUR,1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;