-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Giant Ranger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,44,1);
	checkRegime(killer,mob,45,2);
end;	
