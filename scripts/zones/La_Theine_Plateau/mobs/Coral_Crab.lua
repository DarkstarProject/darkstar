-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Coral Crab	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,70,2);
	checkRegime(killer,mob,71,1);
end;	
