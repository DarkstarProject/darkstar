-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Coral Crab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,70,2);
end;	
