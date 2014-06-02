-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Bark Tarantula	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,725,2);
end;	