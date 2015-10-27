-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Huge Hornet	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,76,1);
end;	
