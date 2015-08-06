-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Boggart	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,63,2);
end;	
