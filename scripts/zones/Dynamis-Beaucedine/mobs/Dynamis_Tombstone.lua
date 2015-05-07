-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Tombstone
-- Trigger for Fire Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326273):updateClaim(target);
	SpawnMob(17326255):updateClaim(target);
	SpawnMob(17326212):updateClaim(target);
	SpawnMob(17326237):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;