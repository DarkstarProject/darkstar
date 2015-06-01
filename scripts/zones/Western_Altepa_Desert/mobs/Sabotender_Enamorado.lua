-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Sabotender Enamorado
-----------------------------------	
	
require("scripts/globals/missions");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
local currentMission = killer:getCurrentMission(SANDORIA);
	  MissionStatus = killer:getVar("MissionStatus");
	
	if(currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
		killer:setVar("Mission6-1MobKilled",1);
	end
	
end;
