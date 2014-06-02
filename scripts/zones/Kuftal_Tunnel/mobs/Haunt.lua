-----------------------------------	
-- Area: Kuftal Tunnel
-- MOB:  Haunt	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,736,2);
end;	