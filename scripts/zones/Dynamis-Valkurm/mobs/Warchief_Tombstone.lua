-----------------------------------
-- Area: Dynamis Valkurm
-- NPC:  Warchief_Tombstone
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
local mobID = mob:getID();
	if(mobID == 16937214 and alreadyReceived(killer,4) == false)then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,8);
		--print("addtime 10min");
	elseif(mobID == 16937212 and alreadyReceived(killer,5) == false)then
	    killer:addTimeToDynamis(20);
		addDynamisList(killer,16);
		--print("addtime 20min");
	end
end;