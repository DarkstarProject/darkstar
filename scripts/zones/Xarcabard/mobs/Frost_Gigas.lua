-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Frost Gigas	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,54,1);
	checkRegime(killer,mob,55,2);
end;	
