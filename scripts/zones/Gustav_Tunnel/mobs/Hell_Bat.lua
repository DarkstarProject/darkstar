-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Hell Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,763,3);
end;	