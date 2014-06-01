-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Poroggo Excavator
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,625,2);
end;	
