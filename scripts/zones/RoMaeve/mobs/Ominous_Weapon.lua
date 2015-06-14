-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Ominous Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,119,2);
end;	
