-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Jelly
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,729,2);
end;	