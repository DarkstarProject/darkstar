-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Sodden Bones
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,623,2);
end;	
