-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Savanna Rarab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,27,1);
end;	
