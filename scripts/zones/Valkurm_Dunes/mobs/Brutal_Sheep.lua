-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Brutal Sheep	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,10,1);
end;	
