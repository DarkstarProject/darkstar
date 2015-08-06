-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Hill Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,7,1);
	checkRegime(killer,mob,8,2);
end;	
