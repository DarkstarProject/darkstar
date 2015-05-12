-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Dynamis Statue
-- Trigger for Poison Pukis respawn
-----------------------------------

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	SpawnMob(17326458):updateClaim(target);
	SpawnMob(17326446):updateClaim(target);
	SpawnMob(17326374):updateClaim(target);
	SpawnMob(17326415):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;