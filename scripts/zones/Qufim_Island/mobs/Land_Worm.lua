-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Land Worm	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,41,2);
end;	
