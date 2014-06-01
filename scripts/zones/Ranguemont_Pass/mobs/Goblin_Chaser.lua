-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Goblin Chaser	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,608,2);
end;	
