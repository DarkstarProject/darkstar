-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Fuligo	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,669,2);
	checkRegime(killer,mob,670,2);
end;	