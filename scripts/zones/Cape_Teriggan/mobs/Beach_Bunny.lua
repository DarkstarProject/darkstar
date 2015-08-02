-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Beach Bunny	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,104,1);
end;	
