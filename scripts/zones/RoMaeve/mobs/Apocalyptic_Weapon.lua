-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Apocalyptic Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,122,1);
end;	
