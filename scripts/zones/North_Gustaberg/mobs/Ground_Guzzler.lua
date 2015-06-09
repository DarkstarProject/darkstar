-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Ground Guzzler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,16,1);
end;	
