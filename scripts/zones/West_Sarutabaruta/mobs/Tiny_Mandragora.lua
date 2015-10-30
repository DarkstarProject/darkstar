-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Tiny Mandragora	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,26,1);
end;	
