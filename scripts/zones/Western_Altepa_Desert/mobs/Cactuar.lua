-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Cactuar	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,136,2);
end;	
