-----------------------------------	
-- Area: Korroloka Tunnel
-- MOB:  Seeker Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,727,2);
	checkRegime(killer,mob,728,1);
end;	