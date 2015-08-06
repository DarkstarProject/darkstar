-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Carnivorous Crawler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,33,1);
	checkRegime(killer,mob,34,2);
end;	
