-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Jotunn Wildkeeper	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,787,2);
	checkRegime(killer,mob,789,1);
end;	