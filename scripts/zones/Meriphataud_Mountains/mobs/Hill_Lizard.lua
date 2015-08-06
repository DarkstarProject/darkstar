-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Hill Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,37,1);
	checkRegime(killer,mob,38,2);
end;	
