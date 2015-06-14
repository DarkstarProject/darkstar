-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Desert Beetle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,136,1);
end;	
