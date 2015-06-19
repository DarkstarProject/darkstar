-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Sand Beetle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,110,3);
end;	
