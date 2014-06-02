-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Natty Gibbon
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,646,2);
end;	