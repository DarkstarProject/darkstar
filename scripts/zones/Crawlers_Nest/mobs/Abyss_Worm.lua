-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Abyss Worm	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,699,1);
	checkRegime(killer,mob,700,1);
end;	