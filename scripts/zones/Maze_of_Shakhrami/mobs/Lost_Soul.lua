-----------------------------------
-- Area: 
-- Mob: Lost_Soul
-- location @pos 
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if(killer:getVar("EquipedforAllOccasions") == 1) then
		killer:setVar("EquipedforAllOccasions",2);
	end
end;
	

