-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Wild Sheep	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,56,1);
end;	
