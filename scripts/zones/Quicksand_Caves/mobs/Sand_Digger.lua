-----------------------------------	
-- Area:  Quicksand Caves
-- MOB:   Sand Digger	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,814,1);
end;	