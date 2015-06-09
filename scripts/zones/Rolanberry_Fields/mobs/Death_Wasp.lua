-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Death Wasp	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,25,1);
	checkRegime(killer,mob,85,1);
end;	
