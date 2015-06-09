-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Akbaba	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,69,2);
end;	
