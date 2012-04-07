-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Chuglix Berrypaws	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,86,2);
end;	
