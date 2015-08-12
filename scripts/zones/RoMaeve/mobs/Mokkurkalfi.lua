-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Mokkurkalfi
-----------------------------------	

require("scripts/globals/missions");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	
	if (killer:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and killer:getVar("MissionStatus") == 1) then
		killer:setVar("Mission7-1MobKilled",1);
	end
	
end;	
