-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Thug	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,640,1);
end;	
