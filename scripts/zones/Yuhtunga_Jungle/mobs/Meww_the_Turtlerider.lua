-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Meww the Turtlerider	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,127,1);
end;	
