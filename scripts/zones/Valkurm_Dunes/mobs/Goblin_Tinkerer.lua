-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Goblin Tinkerer	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,57,2);
end;	
