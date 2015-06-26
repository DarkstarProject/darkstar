-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Tsaagan	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,39,1);
end;	
