-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Effigy
-- Trigger for Petro Pukis respawn
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326179):updateEnmity(target);
	GetMobByID(17326179):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326135):updateEnmity(target);
	GetMobByID(17326135):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326156):updateEnmity(target);
	GetMobByID(17326156):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326168):updateEnmity(target);
	GetMobByID(17326168):setMobMod(MOBMOD_MAIN_2HOUR,1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;