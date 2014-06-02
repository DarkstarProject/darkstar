-----------------------------------	
-- Area: Maze of Shakhrami
-- MOB:  Maze Maker	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,696,1);
end;	