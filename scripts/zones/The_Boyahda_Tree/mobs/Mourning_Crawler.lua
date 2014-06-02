-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Mourning Crawler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,726,3);
end;	