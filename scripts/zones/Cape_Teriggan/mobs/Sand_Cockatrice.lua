-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Sand Cockatrice	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,107,2);
	checkRegime(killer,mob,108,1);
end;	
