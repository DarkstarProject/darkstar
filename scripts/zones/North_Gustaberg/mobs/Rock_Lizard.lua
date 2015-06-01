-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Rock Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,19,2);
end;	
