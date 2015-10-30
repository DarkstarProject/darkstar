-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Ornery Sheep	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,59,2);
end;	
