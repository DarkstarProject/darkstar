-----------------------------------	
-- Area:  Middle Delkfutt's Tower
-- MOB:   Goblin Pathfinder	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,782,1);
	checkRegime(killer,mob,784,1);
end;	