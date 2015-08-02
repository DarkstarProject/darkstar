-----------------------------------	
-- Area: South Gustaberg	
-- MOB:  Bubbly Bernie	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,80,2);
end;	
