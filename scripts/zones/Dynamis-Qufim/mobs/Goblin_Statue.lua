-----------------------------------
-- Area: Dynamis qufim
-- NPC:  Goblin_Statue
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
	if(mobID == 16945509 and alreadyReceived(killer,3) == false)then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,4);
		--print("addtime 10min");
	elseif(mobID == 16945530 and alreadyReceived(killer,5) == false)then
	    killer:addTimeToDynamis(20);
		addDynamisList(killer,16);
		--print("addtime 20min");
	end
end;