-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Forest Hare	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,2,1);
end;	
