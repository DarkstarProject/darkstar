-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Explosure	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,706,2);
end;