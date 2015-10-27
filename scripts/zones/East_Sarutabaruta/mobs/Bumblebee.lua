-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Bumblebee	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,90,1);
end;	
