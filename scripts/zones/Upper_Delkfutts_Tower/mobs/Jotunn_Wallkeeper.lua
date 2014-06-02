-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Jotunn Wallkeeper	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,786,1);
	checkRegime(killer,mob,789,2);
end;	