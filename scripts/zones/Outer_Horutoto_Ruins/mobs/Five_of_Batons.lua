-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Five of Batons	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,664,2);
end;	