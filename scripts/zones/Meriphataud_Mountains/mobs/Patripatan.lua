-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Patripatan	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,63,1);
end;	
