-----------------------------------	
-- Area: Konschtat Highlands	
-- MOB:  Goblin Tinkerer	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,84,2);
end;	
