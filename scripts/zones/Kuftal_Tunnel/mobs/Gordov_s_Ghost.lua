-----------------------------------	
-- Area: Kuftal Tunnel	
-- MOB:  Gordov's Ghost
-----------------------------------	

require("scripts/globals/missions");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	
	if(killer:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and killer:getVar("MissionStatus") == 1) then
		killer:setVar("Mission8-2MobKilled",1);
	end
	
end;	
