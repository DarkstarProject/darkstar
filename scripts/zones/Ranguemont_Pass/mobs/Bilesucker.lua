-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Bilesucker
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,607,1);
end;	
