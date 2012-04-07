-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Bedrock Barry	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,16,1);
end;	
