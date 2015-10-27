-----------------------------------	
-- Area: East Ronfaure	
-- MOB:  Wild Sheep	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,68,1);
end;	
