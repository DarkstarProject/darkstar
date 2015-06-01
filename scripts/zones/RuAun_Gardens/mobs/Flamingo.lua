-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Flamingo	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,142,1);
end;	
