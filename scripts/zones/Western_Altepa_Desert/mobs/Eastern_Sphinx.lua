-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Eastern Sphinx
-----------------------------------	
	
require("scripts/globals/missions");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	
	if(killer:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and killer:getVar("MissionStatus") == 2) then
		killer:setVar("Mission6-1MobKilled",1);
	end
	
end;