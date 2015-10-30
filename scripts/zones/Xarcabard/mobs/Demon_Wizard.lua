-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Demon Wizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,55,1);
end;	
