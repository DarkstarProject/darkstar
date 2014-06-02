-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Droma	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,707,1);
end;	