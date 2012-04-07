-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Sprinkler	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,142,2);
	checkRegime(killer,mob,143,1);
end;	
