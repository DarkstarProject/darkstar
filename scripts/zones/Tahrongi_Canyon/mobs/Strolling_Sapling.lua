-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Strolling Sapling	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,30,1);
end;	
