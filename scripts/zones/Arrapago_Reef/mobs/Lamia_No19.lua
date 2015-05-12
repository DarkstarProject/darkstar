-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Medusa
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

	SpawnMob(16998869,180):updateClaim(target);
	SpawnMob(16998870,180):updateClaim(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;