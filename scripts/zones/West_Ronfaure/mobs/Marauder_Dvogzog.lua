-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Marauder Dvogzog	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/globals/missions");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	if (killer:getCurrentMission(SANDORIA) == PRESTIGE_OF_THE_PAPSQUE and killer:getVar("MissionStatus") == 1) then
		killer:setVar("Mission7-1MobKilled",1);
	end
	    checkRegime(killer,mob,4,1);
end;	
