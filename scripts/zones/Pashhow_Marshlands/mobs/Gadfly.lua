-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  Gadfly	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,21,1);
	checkRegime(killer,mob,22,2);
end;	
