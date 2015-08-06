-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Fire Elemental	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,145,1);
end;	
