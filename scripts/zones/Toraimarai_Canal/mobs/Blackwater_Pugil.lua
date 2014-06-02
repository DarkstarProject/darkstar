-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Blackwater Pugil
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,624,1);
end;	
