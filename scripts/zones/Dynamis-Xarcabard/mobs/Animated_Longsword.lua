-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Longsword
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
		SetDropRate(111,1573,100);
	else
		SetDropRate(111,1573,0);
	end
	
	SpawnMob(17330355,120):updateEnmity(target);
	SpawnMob(17330356,120):updateEnmity(target);
	SpawnMob(17330357,120):updateEnmity(target);
	SpawnMob(17330362,120):updateEnmity(target);
	SpawnMob(17330363,120):updateEnmity(target);
	SpawnMob(17330364,120):updateEnmity(target);

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
	
	DespawnMob(17330355);
	DespawnMob(17330356);
	DespawnMob(17330357);
	DespawnMob(17330362);
	DespawnMob(17330363);
	DespawnMob(17330364);
	
end;