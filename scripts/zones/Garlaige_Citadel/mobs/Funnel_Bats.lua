-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Funnel Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,706,1);
end;	