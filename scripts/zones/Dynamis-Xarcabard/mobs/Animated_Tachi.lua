-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Tachi
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
		SetDropRate(117,1580,100);
	else
		SetDropRate(117,1580,0);
	end
	
	SpawnMob(17330445,120):updateEnmity(target);
	SpawnMob(17330446,120):updateEnmity(target);
	SpawnMob(17330447,120):updateEnmity(target);
	SpawnMob(17330457,120):updateEnmity(target);
	SpawnMob(17330458,120):updateEnmity(target);
	SpawnMob(17330459,120):updateEnmity(target);

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
	
	DespawnMob(17330445);
	DespawnMob(17330446);
	DespawnMob(17330447);
	DespawnMob(17330457);
	DespawnMob(17330458);
	DespawnMob(17330459);
	
end;