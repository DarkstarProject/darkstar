-----------------------------------	
-- Area: The Sanctuary of ZiTah	
-- MOB:  Myxomycete	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,115,1);
	checkRegime(killer,mob,116,2);
end;	
