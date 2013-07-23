-----------------------------------
-- Area: Dynamis tavnazia
-- NPC:  Statue_Prototype
-----------------------------------

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
	if(mobID == 16949325 and alreadyReceived(killer,3) == false)then
		killer:addTimeToDynamis(10);
		addDynamisList(killer,4);
		--print("addtime 10min");
	end
end;