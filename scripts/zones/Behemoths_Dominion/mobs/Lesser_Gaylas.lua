-----------------------------------	
-- Area: Behemoths Dominion	
-- MOB:  Lesser Gaylas	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,101,1);
	checkRegime(killer,mob,102,1);
end;	
