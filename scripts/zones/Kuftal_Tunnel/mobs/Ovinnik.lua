-----------------------------------	
-- Area: Kuftal Tunnel
-- MOB:  Ovinnik	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,741,1);
end;	