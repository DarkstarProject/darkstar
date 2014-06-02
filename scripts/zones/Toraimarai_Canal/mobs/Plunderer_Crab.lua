-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Plunderer Crab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,623,1);
end;	
