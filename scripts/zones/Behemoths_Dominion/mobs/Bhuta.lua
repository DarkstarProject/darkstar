-----------------------------------	
-- Area: Behemoths Dominion	
-- MOB:  Bhuta	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,103,2);
end;	
