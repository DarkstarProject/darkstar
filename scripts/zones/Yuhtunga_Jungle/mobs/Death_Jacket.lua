-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Death Jacket	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,125,1);
end;	
