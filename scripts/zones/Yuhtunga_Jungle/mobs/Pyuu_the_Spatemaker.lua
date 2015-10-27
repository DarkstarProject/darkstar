-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Pyuu the Spatemaker	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,127,1);
end;	
