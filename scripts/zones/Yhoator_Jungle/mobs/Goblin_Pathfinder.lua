-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Goblin Pathfinder	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,129,2);
end;	
