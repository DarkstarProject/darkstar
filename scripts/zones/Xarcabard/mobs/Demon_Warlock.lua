-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Demon Warlock	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,55,1);
end;	
