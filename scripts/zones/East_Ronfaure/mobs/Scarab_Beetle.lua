-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Scarab Beetle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,68,2);
end;	
