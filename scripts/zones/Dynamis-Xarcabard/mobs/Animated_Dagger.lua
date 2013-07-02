-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Dagger
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
		SetDropRate(103,1572,100);
	else
		SetDropRate(103,1572,0);
	end
	
	SpawnMob(17330306,120):updateEnmity(target);
	SpawnMob(17330307,120):updateEnmity(target);
	SpawnMob(17330308,120):updateEnmity(target);
	SpawnMob(17330316,120):updateEnmity(target);
	SpawnMob(17330317,120):updateEnmity(target);
	SpawnMob(17330318,120):updateEnmity(target);

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
	
	DespawnMob(17330306);
	DespawnMob(17330307);
	DespawnMob(17330308);
	DespawnMob(17330316);
	DespawnMob(17330317);
	DespawnMob(17330318);
	
end;