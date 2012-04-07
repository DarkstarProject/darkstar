-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Bright-handed Kunberry	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,133,1);
end;	
