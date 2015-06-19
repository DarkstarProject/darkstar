-----------------------------------	
-- Area: Behemoths Dominion	
-- MOB:  Greater Gayla	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,101,2);
	checkRegime(killer,mob,103,1);
end;	
