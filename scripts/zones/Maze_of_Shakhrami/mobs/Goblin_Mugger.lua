-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Goblin Mugger	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,695,1);
end;	