-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Effigy
-- Trigger for Petro Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326179):updateClaim(target);
	SpawnMob(17326135):updateClaim(target);
	SpawnMob(17326156):updateClaim(target);
	SpawnMob(17326168):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;