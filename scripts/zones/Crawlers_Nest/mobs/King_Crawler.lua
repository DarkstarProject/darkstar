-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  King Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,693,1);
end;	