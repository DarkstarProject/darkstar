-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Thunder Elemental	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,145,3);
end;	
