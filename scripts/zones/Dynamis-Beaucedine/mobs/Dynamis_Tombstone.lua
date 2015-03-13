-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Tombstone
-- Trigger for Fire Pukis respawn
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326273):updateEnmity(target);
	GetMobByID(17326273):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326255):updateEnmity(target);
	GetMobByID(17326255):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326212):updateEnmity(target);
	GetMobByID(17326212):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17326237):updateEnmity(target);
	GetMobByID(17326237):setMobMod(MOBMOD_MAIN_2HOUR,1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;