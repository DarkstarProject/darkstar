-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Seeker Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,603,1);
end;	
