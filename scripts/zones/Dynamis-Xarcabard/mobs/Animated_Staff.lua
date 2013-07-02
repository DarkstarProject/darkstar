-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Staff
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
		SetDropRate(115,1582,100);
	else
		SetDropRate(115,1582,0);
	end
	
	SpawnMob(17330337,120):updateEnmity(target);
	SpawnMob(17330338,120):updateEnmity(target);
	SpawnMob(17330339,120):updateEnmity(target);
	SpawnMob(17330347,120):updateEnmity(target);
	SpawnMob(17330348,120):updateEnmity(target);
	SpawnMob(17330349,120):updateEnmity(target);

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
	
	DespawnMob(17330337);
	DespawnMob(17330338);
	DespawnMob(17330339);
	DespawnMob(17330347);
	DespawnMob(17330348);
	DespawnMob(17330349);
	
end;