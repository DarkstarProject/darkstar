-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Cold Gigas	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,50,1);
end;	
