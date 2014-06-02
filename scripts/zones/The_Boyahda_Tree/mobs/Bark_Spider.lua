-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Bark Spider	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,719,2);
end;	