-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Killing Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,119,1);
end;	
