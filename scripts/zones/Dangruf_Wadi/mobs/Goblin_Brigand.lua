-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Brigand	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,642,2);
end;	