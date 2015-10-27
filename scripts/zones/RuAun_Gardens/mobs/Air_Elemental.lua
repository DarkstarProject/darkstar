-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Air Elemental	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,145,2);
end;	
