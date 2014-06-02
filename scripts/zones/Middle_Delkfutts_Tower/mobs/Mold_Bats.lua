-----------------------------------	
-- Area:  Middle Delkfutt's Tower
-- MOB:   Mold Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,782,2);
	checkRegime(killer,mob,783,2);
end;	