-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Ancient Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,698,2);
	checkRegime(killer,mob,699,2);
end;	