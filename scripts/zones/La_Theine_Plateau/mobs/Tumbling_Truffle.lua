-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Tumbling Truffle	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,71,2);
end;	
