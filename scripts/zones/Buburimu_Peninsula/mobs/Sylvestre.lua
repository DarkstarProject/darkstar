-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Sylvestre	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,32,1);
	checkRegime(killer,mob,33,2);
end;	
