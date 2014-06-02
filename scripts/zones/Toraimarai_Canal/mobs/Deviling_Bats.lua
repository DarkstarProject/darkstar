-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Deviling Bats
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,622,2);
end;	
