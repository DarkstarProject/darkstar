-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Mandragora	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,89,1);
end;	
