-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Korrigan	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,722,1);
end;	