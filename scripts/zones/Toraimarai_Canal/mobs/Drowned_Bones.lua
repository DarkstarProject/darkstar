-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Drowned Bones
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,624,2);
end;	
