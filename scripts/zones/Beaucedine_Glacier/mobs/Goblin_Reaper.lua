-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Goblin Reaper	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,46,2);
	checkRegime(killer,mob,49,1);
	checkRegime(killer,mob,50,2);
end;	
