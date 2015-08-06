-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Numbing Norman	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,61,2);
end;	
