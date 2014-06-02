-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Chaser Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,701,1);
end;	