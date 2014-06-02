-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Six of Batons	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,665,2);
end;	