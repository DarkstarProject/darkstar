-----------------------------------	
-- Area: Ve'Lugannon Palace
-- MOB:  Dustbuster	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,743,1);
	checkRegime(killer,mob,745,1);
end;	