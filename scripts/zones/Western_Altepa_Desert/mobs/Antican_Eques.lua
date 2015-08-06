-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Antican Eques	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,135,2);
end;	
