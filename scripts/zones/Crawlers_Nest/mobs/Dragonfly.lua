-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Dragonfly	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,691,3);
end;	