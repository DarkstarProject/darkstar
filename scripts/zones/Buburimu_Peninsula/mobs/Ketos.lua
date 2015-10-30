-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Ketos	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,62,1);
end;	
