-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Mighty Rarab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,32,2);
end;	
