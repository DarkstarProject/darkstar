-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  River Crab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,92,1);
end;	
