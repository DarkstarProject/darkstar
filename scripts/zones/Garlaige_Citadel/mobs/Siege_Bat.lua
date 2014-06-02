-----------------------------------	
-- Area: Garlaige Citadel
-- MOB:  Siege Bat
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,704,1);
end;	