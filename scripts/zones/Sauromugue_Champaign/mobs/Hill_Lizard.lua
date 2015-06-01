-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Hill Lizard	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,40,1);
end;	
