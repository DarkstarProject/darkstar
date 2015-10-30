-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Evil Eye	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,53,1);
	checkRegime(killer,mob,54,2);
	checkRegime(killer,mob,55,3);
end;	
