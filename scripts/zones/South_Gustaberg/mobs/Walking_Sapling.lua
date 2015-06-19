-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Walking Sapling	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,78,2);
end;	
