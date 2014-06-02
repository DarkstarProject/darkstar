-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Jotunn Gatekeeper	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,786,2);
	checkRegime(killer,mob,788,1);
end;	