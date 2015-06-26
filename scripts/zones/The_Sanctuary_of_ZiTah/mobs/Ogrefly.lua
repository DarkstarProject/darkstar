-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Ogrefly	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,114,1);
	checkRegime(killer,mob,115,2);
end;	
