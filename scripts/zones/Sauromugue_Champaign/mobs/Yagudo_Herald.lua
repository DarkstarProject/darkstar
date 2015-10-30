-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Yagudo Herald	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,99,2);
end;	
