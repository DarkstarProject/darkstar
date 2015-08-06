-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Goblin Mercenary	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,105,2);
end;	
