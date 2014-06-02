-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Chamber Beetle	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,707,2);
end;	