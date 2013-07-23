-----------------------------------
-- Area: Dynamis tavnazia
-- NPC:  Icon_Prototype
-----------------------------------
require("scripts/globals/dynamis");
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

    if(mobID == 16949306 and alreadyReceived(killer,2) == false)then
		killer:addTimeToDynamis(10);
		--print("addtime 10min");
		addDynamisList(killer,2);
	end
	
end;