-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Hell Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,618,1);
end;	
