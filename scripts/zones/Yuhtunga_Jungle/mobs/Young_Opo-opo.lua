-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Young Opo-opo	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,126,1);
	checkRegime(killer,mob,128,1);
end;	
