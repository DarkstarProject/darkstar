-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Wadi Hare	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,641,1);
end;	