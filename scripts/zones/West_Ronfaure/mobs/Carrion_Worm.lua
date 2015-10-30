-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Carrion Worm	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,1,1);
end;	
