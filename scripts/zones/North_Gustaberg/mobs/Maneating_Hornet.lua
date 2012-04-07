-----------------------------------	
-- Area: North Gustaberg	
-- MOB:  Maneating Hornet	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,17,1);
end;	
