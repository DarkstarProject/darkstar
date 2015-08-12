-----------------------------------
-- Area: Dynamis Buburimu
-- NPC:  Manifest_Idol
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Valkurm/TextIDs");
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
	
    if (mobID == 16941211 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(10);
		--print("addtime 10min");
		mob:addInBattlefieldList();
	end
	
	
	
end;