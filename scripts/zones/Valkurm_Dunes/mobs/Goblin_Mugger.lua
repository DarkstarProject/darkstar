-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Goblin Mugger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,57,2);
end;	
