-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Giant Spider	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,109,1);
end;	
