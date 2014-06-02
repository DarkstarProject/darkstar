-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Viseclaw	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,726,1);
end;	