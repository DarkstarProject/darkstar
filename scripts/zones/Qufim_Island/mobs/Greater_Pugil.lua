-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Greater Pugil	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,43,1);
	checkRegime(killer,mob,44,2);
	checkRegime(killer,mob,45,3);
end;	
