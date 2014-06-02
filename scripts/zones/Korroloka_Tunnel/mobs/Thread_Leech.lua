-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Thread Leech	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,730,1);
end;	