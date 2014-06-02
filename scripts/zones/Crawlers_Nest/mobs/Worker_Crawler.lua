-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Worker Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,687,1);
end;	