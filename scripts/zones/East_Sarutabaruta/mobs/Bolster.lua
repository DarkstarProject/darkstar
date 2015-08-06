-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Bolster	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,92,2);
	checkRegime(killer,mob,93,2);
end;	
