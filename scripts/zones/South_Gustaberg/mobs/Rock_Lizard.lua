-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Rock Lizard	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,80,1);
end;	
