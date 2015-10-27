-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  Jolly Green	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,60,3);
end;	
