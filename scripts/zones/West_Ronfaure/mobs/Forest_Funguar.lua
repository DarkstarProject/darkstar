-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Forest Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,3,2);
end;	
