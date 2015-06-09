-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Noctonberry Ninja	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,133,1);
end;	
