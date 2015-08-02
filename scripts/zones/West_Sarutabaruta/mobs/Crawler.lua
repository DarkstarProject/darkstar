-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Crawler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,28,1);
	checkRegime(killer,mob,29,2);
end;	
