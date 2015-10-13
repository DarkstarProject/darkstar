-----------------------------------	
-- Area: Kuftal Tunnel	
-- MOB:  Dervo's Ghost
-----------------------------------	

require("scripts/globals/missions");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	
	if (killer:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and killer:getVar("MissionStatus") == 2) then
		killer:setVar("MissionStatus",3);
	end
	
end;	
