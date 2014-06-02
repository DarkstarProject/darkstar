-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Hawker	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,764,1);
end;	