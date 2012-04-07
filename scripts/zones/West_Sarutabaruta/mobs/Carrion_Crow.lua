-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Carrion Crow	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,28,2);
end;	
