-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Rumble Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,691,1);
end;	