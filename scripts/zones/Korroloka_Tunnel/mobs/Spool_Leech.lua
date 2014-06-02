-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Spool Leech	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,734,2);
end;	