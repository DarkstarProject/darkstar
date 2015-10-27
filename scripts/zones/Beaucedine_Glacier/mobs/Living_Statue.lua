-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Living Statue	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,47,2);
	checkRegime(killer,mob,48,2);
	checkRegime(killer,mob,49,3);
end;	
