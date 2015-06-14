-----------------------------------	
-- Area: Konschtat Highlands	
-- MOB:  Huge Wasp	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,81,2);
	checkRegime(killer,mob,82,1);
end;	
