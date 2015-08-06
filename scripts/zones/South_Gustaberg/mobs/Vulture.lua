-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Vulture	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,78,1);
end;	
