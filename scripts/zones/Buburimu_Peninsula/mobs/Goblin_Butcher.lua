-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Goblin Butcher	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,62,2);
end;	
