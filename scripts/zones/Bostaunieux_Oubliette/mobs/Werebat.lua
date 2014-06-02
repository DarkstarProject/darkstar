-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Werebat
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,611,2);
end;	
