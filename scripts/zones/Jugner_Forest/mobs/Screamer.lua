-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Screamer	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,58,2);
end;	
