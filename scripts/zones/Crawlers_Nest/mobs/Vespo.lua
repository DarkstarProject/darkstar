-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Vespo	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,693,2);
end;	