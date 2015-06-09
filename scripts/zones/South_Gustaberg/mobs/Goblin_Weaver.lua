-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Goblin Weaver	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,79,1);
end;	
