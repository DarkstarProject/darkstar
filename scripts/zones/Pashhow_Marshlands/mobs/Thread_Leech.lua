-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  Thread Leech	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,22,1);
	checkRegime(killer,mob,23,2);
end;	
