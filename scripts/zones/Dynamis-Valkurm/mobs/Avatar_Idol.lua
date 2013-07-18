-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Manifest_Idol
-----------------------------------
package.loaded["scripts/zones/Dynamis-Valkurm/TextIDs"] = nil;
-----------------------------------
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
	
    if(mobID == 16937264 and alreadyReceived(killer,2) == false)then
		killer:addTimeToDynamis(10);
		--print("addtime 10min");
		addDynamisList(killer,2);
	elseif(mobID == 16937262 and alreadyReceived(killer,5) == false)then
	    killer:addTimeToDynamis(20);
		--print("addtime 20min");
		addDynamisList(killer,16);
	end
	
	
	
end;