-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Wandering Sapling	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,58,1);
end;	
