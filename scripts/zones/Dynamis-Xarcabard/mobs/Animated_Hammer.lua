-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Hammer
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
		SetDropRate(106,1581,100);
	else
		SetDropRate(106,1581,0);
	end
	
	SpawnMob(17330334,120):updateEnmity(target);
	SpawnMob(17330335,120):updateEnmity(target);
	SpawnMob(17330336,120):updateEnmity(target);
	SpawnMob(17330344,120):updateEnmity(target);
	SpawnMob(17330345,120):updateEnmity(target);
	SpawnMob(17330346,120):updateEnmity(target);

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
	
	DespawnMob(17330334);
	DespawnMob(17330335);
	DespawnMob(17330336);
	DespawnMob(17330344);
	DespawnMob(17330345);
	DespawnMob(17330346);
	
end;