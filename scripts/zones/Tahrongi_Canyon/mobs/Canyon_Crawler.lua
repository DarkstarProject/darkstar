-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Canyon Crawler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,96,1);
end;	
