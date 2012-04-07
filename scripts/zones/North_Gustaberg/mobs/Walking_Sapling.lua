-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Walking Sapling	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,18,2);
end;	
