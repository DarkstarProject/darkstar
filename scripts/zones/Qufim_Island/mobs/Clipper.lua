-----------------------------------	
-- Area: Qufim Island	
-- MOB:  Clipper	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,41,1);
	checkRegime(killer,mob,42,1);
	checkRegime(killer,mob,43,2);
end;	
