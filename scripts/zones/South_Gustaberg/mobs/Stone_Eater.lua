-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Stone Eater	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,77,1);
end;	
