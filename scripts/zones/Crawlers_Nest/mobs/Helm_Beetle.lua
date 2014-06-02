-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Helm Beetle	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,692,1);
end;	