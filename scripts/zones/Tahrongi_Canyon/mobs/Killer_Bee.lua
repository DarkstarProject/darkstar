-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Killer Bee	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,30,2);
	checkRegime(killer,mob,95,2);
end;	
