-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Akbaba	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,31,1);
end;	
