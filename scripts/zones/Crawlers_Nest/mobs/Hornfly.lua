-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Hornfly	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,690,2);
end;	