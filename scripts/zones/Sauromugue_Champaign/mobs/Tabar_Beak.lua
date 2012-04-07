-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Tabar Beak	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,100,1);
end;	
