-----------------------------------	
-- Area: Yuhtunga Jungle	
-- MOB:  Goblin Poacher	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,125,2);
end;	
