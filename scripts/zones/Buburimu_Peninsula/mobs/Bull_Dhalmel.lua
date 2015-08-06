-----------------------------------	
-- Area: Buburimu Peninsula	
-- MOB:  Bull Dhalmel	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,34,1);
	checkRegime(killer,mob,35,2);
end;	
