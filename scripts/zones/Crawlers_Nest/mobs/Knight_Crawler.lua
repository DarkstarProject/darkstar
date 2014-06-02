-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Knight Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,692,2);
end;	