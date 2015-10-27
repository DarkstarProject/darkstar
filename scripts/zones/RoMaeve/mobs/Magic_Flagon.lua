-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Magic Flagon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,120,1);
end;	
