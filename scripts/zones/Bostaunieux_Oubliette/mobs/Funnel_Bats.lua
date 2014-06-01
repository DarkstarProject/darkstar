-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Funnel Bats
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,611,1);
end;	
