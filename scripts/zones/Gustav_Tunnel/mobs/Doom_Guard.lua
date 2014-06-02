-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Doom Guard	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,765,2);
	checkRegime(killer,mob,767,1);
	checkRegime(killer,mob,768,1);
end;	