-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Conjurer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,645,1);
end;	