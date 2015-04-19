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

	SpawnMob(16998863,180):updateEnmity(target);
	SpawnMob(16998864,180):updateEnmity(target);
	SpawnMob(16998865,180):updateEnmity(target);
	SpawnMob(16998866,180):updateEnmity(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(GORGONSTONE_SUNDERER);
end;