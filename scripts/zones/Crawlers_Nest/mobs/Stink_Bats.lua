-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Stink Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,695,2);
end;	