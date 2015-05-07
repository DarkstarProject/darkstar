-----------------------------------
-- Area: Halvung
-- NPC:  Gurfurlur the Menacing
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

	SpawnMob(17031593,180):updateClaim(target);
	SpawnMob(17031594,180):updateClaim(target);
	SpawnMob(17031595,180):updateClaim(target);
	SpawnMob(17031596,180):updateClaim(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TROLL_SUBJUGATOR);
end;