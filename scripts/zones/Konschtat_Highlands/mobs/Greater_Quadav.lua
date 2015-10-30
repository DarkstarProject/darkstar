-----------------------------------	
-- Area: Konschtat Highlands	
-- MOB:  Greater Quadav	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,83,1);
end;	
