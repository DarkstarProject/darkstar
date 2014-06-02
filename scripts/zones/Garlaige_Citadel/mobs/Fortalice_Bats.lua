-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Fortalice Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,710,1);
end;	