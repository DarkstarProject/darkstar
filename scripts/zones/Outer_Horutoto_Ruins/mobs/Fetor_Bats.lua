-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Fetor Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,669,1);
end;	