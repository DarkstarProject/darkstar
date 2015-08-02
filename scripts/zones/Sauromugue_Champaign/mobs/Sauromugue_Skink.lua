-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Sauromugue Skink	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,97,1);
	checkRegime(killer,mob,99,1);
end;	
