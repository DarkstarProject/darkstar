-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Exoray	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,690,1);
end;	