-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Fallen Knight
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,619,1);
end;	
