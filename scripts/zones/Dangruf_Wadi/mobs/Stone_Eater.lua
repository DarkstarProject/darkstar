-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Stone Eater	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,639,1);
end;	
