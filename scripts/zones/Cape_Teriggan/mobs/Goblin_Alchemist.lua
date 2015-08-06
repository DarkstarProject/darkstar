-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Goblin Alchemist	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,105,2);
end;	
