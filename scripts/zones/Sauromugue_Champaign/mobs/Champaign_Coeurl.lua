-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Champaign Coeurl	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,98,1);
end;	
