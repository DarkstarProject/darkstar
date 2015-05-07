-----------------------------------
-- Area: Mamook
-- NPC:  Gulool Ja Ja
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)

	SpawnMob(17043876,180):updateClaim(target);
	SpawnMob(17043877,180):updateClaim(target);
	SpawnMob(17043878,180):updateClaim(target);
	SpawnMob(17043879,180):updateClaim(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(SHINING_SCALE_RIFLER);
end;