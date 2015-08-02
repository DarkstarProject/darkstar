-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Thread Leech	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,57,1);
end;	
