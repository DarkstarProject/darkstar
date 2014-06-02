-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Wadi Crab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,640,2);
end;	
