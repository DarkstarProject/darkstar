-----------------------------------	
-- Area: Konschtat Highlands	
-- MOB:  Mist Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,20,2);
	checkRegime(killer,mob,82,2);
end;	
