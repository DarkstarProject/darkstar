-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Orcish Mesmerizer	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,4,1);
end;	
