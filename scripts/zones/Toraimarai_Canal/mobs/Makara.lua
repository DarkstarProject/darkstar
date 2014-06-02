-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Makara
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,618,2);
end;	
