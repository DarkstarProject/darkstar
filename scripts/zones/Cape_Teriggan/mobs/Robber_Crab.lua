-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Robber Crab	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,105,1);
	checkRegime(killer,mob,106,1);
end;	
