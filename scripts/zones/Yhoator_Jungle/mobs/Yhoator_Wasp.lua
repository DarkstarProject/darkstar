-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Yhoator Wasp	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,130,2);
end;	
