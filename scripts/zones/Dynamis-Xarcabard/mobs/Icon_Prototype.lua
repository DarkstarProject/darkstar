-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Icon Prototype
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	local mobID = mob:getID();
	
	-- Time Bonus: 043
	if (mobID == 17330814 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(30);
		mob:addInBattlefieldList();
	-- HP Bonus: 052
	elseif (mobID == 17330533) then
		killer:restoreHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- HP Bonus: 073
	elseif (mobID == 17330843) then
		killer:restoreMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	
end;