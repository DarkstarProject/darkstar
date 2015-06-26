-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Darksteel Golem	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,122,2);
	checkRegime(killer,mob,123,2);
end;	
