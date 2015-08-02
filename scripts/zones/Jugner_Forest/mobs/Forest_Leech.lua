-----------------------------------	
-- Area: Jugner Forest	
-- MOB:  Forest Leech	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,11,1);
	checkRegime(killer,mob,12,2);
end;	
