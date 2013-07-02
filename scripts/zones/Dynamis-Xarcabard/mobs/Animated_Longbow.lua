-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Longbow
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
	mob:addMod(MOD_STUNRES,75); -- Not full resist
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if(GetServerVariable("[DynaXarcabard]Boss_Trigger") == 32767) then
		SetDropRate(110,1583,100);
	else
		SetDropRate(110,1583,0);
	end
	
	SpawnMob(17330522,120):updateEnmity(target);
	SpawnMob(17330523,120):updateEnmity(target);
	SpawnMob(17330524,120):updateEnmity(target);
	SpawnMob(17330525,120):updateEnmity(target);
	SpawnMob(17330526,120):updateEnmity(target);
	SpawnMob(17330527,120):updateEnmity(target);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	DespawnMob(17330522);
	DespawnMob(17330523);
	DespawnMob(17330524);
	DespawnMob(17330525);
	DespawnMob(17330526);
	DespawnMob(17330527);
	
end;