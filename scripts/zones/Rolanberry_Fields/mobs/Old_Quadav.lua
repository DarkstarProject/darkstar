-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Old Quadav	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,87,2);
end;	
