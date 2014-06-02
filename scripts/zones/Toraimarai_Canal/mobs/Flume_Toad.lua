-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Flume Toad
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,625,1);
end;	
