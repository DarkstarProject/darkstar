-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Marauder Dvogzog	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,4,1);
end;	
