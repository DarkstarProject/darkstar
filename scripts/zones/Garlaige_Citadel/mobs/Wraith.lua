-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Wraith	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,708,3);
end;	