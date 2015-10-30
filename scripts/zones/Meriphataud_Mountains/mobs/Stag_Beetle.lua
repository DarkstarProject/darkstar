-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Stag Beetle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,38,1);
	checkRegime(killer,mob,39,2);
end;	
