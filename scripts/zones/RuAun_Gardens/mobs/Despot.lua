-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Despot	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,143,2);
	checkRegime(killer,mob,144,1);
end;	
