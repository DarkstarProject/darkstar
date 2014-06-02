-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Death Jacket	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,687,2);
end;	