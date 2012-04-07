-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Damselfly	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,9,1);
	checkRegime(killer,mob,10,2);
end;	
