-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Jugner Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,13,1);
	checkRegime(killer,mob,14,1);
end;	
