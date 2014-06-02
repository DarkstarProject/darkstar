-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Bladesmith	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,645,2);
end;	