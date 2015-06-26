-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Stone Eater	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,16,1);
end;	
