-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Shield
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
		SetDropRate(113,1822,100);
	else
		SetDropRate(113,1822,0);
	end
	
	SpawnMob(17330290,120):updateEnmity(target);
	SpawnMob(17330291,120):updateEnmity(target);
	SpawnMob(17330292,120):updateEnmity(target);
	SpawnMob(17330299,120):updateEnmity(target);
	SpawnMob(17330300,120):updateEnmity(target);
	SpawnMob(17330301,120):updateEnmity(target);
	
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
	
	DespawnMob(17330290);
	DespawnMob(17330291);
	DespawnMob(17330292);
	DespawnMob(17330299);
	DespawnMob(17330300);
	DespawnMob(17330301);
	
end;