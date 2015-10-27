-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Poison Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,71,2);
end;	
