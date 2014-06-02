-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Citadel Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,705,2);
end;	