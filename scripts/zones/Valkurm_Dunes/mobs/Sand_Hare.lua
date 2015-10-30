-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Sand Hare	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,7,2);
end;	
