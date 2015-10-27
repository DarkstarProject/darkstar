-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Antican Retiarius	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,135,3);
end;	
