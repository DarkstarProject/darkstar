-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Crane Fly	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,36,1);
	checkRegime(killer,mob,37,2);
end;	
