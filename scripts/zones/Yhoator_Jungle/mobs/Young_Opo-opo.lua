-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Young Opo-opo	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,131,1);
	checkRegime(killer,mob,132,2);
end;	
