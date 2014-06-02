-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Wadi Leech
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,641,2);
end;	