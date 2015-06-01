-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Bat Eye	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,48,1);
	checkRegime(killer,mob,49,2);
	checkRegime(killer,mob,50,3);
end;	
