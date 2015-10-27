-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Timeworn Warrior	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,51,1);
	checkRegime(killer,mob,52,1);
	checkRegime(killer,mob,53,2);
	checkRegime(killer,mob,54,3);
end;	
