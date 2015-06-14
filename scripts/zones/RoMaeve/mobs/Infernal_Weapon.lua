-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Infernal Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,123,1);
end;	
