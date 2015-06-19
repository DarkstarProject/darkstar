-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Sleet Gigas	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,50,1);
end;	
