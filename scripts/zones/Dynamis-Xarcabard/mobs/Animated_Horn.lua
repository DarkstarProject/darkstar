-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Horn
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
		SetDropRate(107,1584,100);
	else
		SetDropRate(107,1584,0);
	end
	
	SpawnMob(17330495,120):updateEnmity(target);
	SpawnMob(17330496,120):updateEnmity(target);
	SpawnMob(17330497,120):updateEnmity(target);
	SpawnMob(17330503,120):updateEnmity(target);
	SpawnMob(17330504,120):updateEnmity(target);
	SpawnMob(17330505,120):updateEnmity(target);

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
	
	DespawnMob(17330495);
	DespawnMob(17330496);
	DespawnMob(17330497);
	DespawnMob(17330503);
	DespawnMob(17330504);
	DespawnMob(17330505);
	
end;