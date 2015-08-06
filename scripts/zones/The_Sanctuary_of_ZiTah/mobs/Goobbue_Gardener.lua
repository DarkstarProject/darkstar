-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Goobbue Gardener	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,114,2);
end;	
