-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Hovering Oculus	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,607,2);
end;	
