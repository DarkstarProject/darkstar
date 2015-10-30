-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Bumblebee	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,61,2);
end;	
