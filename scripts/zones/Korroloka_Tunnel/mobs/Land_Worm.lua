-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Land Worm	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,727,1);
end;	