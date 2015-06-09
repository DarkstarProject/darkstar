-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Bakru	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,26,1);
end;	
