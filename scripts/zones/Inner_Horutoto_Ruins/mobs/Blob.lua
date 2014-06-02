-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Blob	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,649,2);
end;	