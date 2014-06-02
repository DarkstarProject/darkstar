-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Headsman	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,643,2);
end;	