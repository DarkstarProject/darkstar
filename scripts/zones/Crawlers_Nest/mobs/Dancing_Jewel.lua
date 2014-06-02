-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Dancing Jewel	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,694,1);
end;	