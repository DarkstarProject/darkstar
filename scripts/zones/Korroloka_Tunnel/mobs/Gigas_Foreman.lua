-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Gigas Foreman
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,733,1);
end;	