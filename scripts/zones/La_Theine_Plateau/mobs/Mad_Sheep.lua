-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Mad Sheep	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,69,1);
	checkRegime(killer,mob,70,1);
end;	
