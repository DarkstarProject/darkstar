-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Incubus Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,786,3);
	checkRegime(killer,mob,787,3);
end;	