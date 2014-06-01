-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Scavenger Crab
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,621,1);
end;	
