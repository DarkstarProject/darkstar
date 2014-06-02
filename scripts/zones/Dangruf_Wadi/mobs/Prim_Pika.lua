-----------------------------------	
-- Area: Dangruf Wadi	
-- MOB:  Prim Pika	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,644,1);
end;	