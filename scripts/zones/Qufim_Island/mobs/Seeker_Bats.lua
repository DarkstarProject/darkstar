-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Seeker Bats	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,42,2);
end;	
