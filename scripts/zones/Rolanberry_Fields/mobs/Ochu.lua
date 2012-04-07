-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Ochu	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,88,1);
end;	
