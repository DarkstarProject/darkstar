-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Desert Spider	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,134,1);
end;	
