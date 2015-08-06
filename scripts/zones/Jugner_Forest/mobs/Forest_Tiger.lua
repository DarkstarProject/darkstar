-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Forest Tiger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,14,2);
end;	
