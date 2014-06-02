-----------------------------------	
-- Area: Crawlers' Nest
-- MOB:  Witch Hazel	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,689,2);
end;	