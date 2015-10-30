-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Forest Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,67,2);
end;	
