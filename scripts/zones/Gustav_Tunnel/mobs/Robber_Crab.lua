-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Robber Crab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,765,1);
end;	