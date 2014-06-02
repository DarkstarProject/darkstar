-----------------------------------	
-- Area:  Quicksand Caves
-- MOB:   Helm Beetle	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,813,1);
end;	