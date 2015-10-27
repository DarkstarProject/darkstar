-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Rock Golem	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,118,1);
end;	
