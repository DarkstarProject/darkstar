-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Jotunn Hallkeeper	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,787,1);
	checkRegime(killer,mob,788,2);
end;	