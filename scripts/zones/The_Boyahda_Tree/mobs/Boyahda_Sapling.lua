-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Boyahda Sapling	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,725,1);
end;	