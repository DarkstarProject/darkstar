-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Goblin Digger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,79,1);
end;	
