-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Yhoator Mandragora	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,130,1);
end;	
