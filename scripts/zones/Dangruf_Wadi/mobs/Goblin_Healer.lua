-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Healer	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,644,2);
end;	