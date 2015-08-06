-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Forest Hare	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,66,1);
end;	
