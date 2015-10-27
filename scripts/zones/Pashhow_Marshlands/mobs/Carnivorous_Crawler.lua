-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  Carnivorous Crawler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,23,1);
	checkRegime(killer,mob,24,2);
end;	
