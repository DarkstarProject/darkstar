-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Master Coeurl	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,117,1);
	checkRegime(killer,mob,118,2);
end;	
