-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Snipper	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,8,1);
	checkRegime(killer,mob,9,2);
end;	
