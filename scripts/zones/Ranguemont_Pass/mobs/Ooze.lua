-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Ooze	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,603,2);
end;	
