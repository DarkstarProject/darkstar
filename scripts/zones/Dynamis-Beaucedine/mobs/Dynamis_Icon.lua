-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Icon
-- Trigger for Wind Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326325):updateClaim(target);
	SpawnMob(17326323):updateClaim(target);
	SpawnMob(17326295):updateClaim(target);
	SpawnMob(17326319):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;