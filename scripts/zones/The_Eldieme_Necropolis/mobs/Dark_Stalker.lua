-----------------------------------	
-- Area: The Eldieme Necropolis	
-- MOB:  Dark Stalker
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,672,1);
	checkRegime(killer,mob,673,1);
end;	