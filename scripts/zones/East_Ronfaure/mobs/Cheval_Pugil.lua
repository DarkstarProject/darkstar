-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Cheval Pugil	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,64,1);
end;	
