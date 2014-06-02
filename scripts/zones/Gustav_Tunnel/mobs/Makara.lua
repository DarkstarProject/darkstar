-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Makara	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,764,2);
end;	