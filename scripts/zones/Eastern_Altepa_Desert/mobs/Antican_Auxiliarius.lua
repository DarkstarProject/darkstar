-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Antican Auxiliarius	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,110,1);
end;	
