-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Goblin Ambusher	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,640,1);
end;	
