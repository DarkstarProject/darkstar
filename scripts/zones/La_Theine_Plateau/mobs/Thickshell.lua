-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Thickshell	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,70,2);
end;	
