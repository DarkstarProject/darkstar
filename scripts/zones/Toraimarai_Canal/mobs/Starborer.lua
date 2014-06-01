-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Starborer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,622,1);
end;	
