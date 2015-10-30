-----------------------------------	
-- Area: Tahrongi Canyon	
-- MOB:  Pygmaioi	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,94,2);
	checkRegime(killer,mob,95,1);
end;	
