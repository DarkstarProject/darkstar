-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Caterchipillar	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,698,1);
end;	