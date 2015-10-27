-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Vulture	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,18,1);
end;	
