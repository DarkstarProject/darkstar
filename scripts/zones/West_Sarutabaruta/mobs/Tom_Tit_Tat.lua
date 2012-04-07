-----------------------------------	
-- Area: West Sarutabaruta	
-- MOB:  Tom Tit Tat	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,26,1);
end;	
