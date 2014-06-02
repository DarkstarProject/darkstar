-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Bloodsucker
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,620,2);
end;	
