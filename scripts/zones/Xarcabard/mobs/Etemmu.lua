-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Etemmu	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,51,2);
end;	
