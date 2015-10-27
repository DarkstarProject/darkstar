-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Stag Beetle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,12,1);
	checkRegime(killer,mob,13,2);
end;	
