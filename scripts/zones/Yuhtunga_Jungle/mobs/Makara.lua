-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Makara	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,127,2);
end;	
