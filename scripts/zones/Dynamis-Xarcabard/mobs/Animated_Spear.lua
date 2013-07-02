-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Spear
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
		SetDropRate(114,1578,100);
	else
		SetDropRate(114,1578,0);
	end
	
	SpawnMob(17330423,120):updateEnmity(target);
	SpawnMob(17330424,120):updateEnmity(target);
	SpawnMob(17330425,120):updateEnmity(target);
	SpawnMob(17330435,120):updateEnmity(target);
	SpawnMob(17330436,120):updateEnmity(target);
	SpawnMob(17330437,120):updateEnmity(target);

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
	
	DespawnMob(17330423);
	DespawnMob(17330424);
	DespawnMob(17330425);
	DespawnMob(17330435);
	DespawnMob(17330436);
	DespawnMob(17330437);
	
end;