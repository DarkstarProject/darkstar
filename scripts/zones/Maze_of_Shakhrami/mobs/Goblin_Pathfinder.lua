-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Goblin Pathfinder	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,695,1);
end;	