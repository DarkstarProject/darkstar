-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Icon
-- Trigger for Wind Pukis respawn
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326325):updateEnmity(target);
	GetMobByID(17326325):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326323):updateEnmity(target);
	GetMobByID(17326323):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326295):updateEnmity(target);
	GetMobByID(17326295):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326319):updateEnmity(target);
	GetMobByID(17326319):setMobMod(MOBMOD_MAIN_2HOUR,1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;