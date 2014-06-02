-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Hecteyes	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,606,2);
end;	
