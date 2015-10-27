-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Goobbue Parasite	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,116,1);
	checkRegime(killer,mob,117,2);
end;	
