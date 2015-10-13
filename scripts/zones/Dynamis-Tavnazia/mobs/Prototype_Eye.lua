-----------------------------------
-- Area: Dynamis tavnazia
-- NPC:  Prototype_Eye
-----------------------------------
require("scripts/globals/status");
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
	if (mobID == 16949380 and mob:isInBattlefieldList() == false) then
	    killer:addTimeToDynamis(20);
		--print("addtime 20min");
		mob:addInBattlefieldList();
	end

end;