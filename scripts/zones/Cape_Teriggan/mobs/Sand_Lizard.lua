-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Sand Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,104,2);
end;	
