-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Canyon Rarab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,94,1);
end;	
