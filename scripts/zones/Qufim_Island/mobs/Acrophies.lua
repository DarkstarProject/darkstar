-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Acrophies	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,45,1);
end;	
