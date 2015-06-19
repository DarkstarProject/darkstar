-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Grass Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,6,1);
	checkRegime(killer,mob,71,2);
end;	
