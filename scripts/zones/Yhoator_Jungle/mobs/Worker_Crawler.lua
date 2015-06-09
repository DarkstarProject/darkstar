-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Worker Crawler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,132,1);
end;	
