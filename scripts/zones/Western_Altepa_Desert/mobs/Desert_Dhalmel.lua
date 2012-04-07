-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Desert Dhalmel	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,135,1);
end;	
