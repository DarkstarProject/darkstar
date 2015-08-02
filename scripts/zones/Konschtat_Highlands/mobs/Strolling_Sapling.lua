-----------------------------------	
-- Area: Konschtat Highlands	
-- MOB:  Strolling Sapling	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,81,1);
end;	
