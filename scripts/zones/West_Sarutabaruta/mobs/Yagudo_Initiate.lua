-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Yagudo Initiate	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,29,1);
	checkRegime(killer,mob,61,1);
end;	
