-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Kunai
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
		SetDropRate(109,1579,100);
	else
		SetDropRate(109,1579,0);
	end
	
	SpawnMob(17330442,120):updateEnmity(target);
	SpawnMob(17330443,120):updateEnmity(target);
	SpawnMob(17330444,120):updateEnmity(target);
	SpawnMob(17330454,120):updateEnmity(target);
	SpawnMob(17330455,120):updateEnmity(target);
	SpawnMob(17330456,120):updateEnmity(target);

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
	
	DespawnMob(17330442);
	DespawnMob(17330443);
	DespawnMob(17330444);
	DespawnMob(17330454);
	DespawnMob(17330455);
	DespawnMob(17330456);
	
end;