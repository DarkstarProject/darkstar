-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Scarab Beetle	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,3,1);
	checkRegime(killer,mob,4,2);
end;	
