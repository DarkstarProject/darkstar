-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Duke Berith
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

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
	
	local Animate_Trigger = GetServerVariable("[DynaXarcabard]Boss_Trigger");
	
	if (mob:isInBattlefieldList() == false) then
		mob:addInBattlefieldList();
		Animate_Trigger = Animate_Trigger + 32;
		SetServerVariable("[DynaXarcabard]Boss_Trigger",Animate_Trigger);
		
		if (Animate_Trigger == 32767) then
			SpawnMob(17330911); -- 142
			SpawnMob(17330912); -- 143
			SpawnMob(17330183); -- 177
			SpawnMob(17330184); -- 178
			
			activateAnimatedWeapon(); -- Change subanim of all animated weapon
		end
	end
	
	if (Animate_Trigger == 32767) then
		killer:messageSpecial(PRISON_OF_SOULS_HAS_SET_FREE);
	end
	
end;