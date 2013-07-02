-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Count Zaebos
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
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
	
	SetServerVariable("[DynaXarcabard]Boss_Trigger",GetServerVariable("[DynaXarcabard]Boss_Trigger") + 128);
	
	if(GetServerVariable("[DynaXarcabard]Boss_Trigger") == 32767) then
		SpawnMob(17330911); -- 142
		SpawnMob(17330912); -- 143
		SpawnMob(17330183); -- 177
		SpawnMob(17330184); -- 178
		activateAnimatedWeapon(); -- Change subanim of all animated weapon
	end
	
end;