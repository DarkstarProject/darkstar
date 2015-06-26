-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Antican Lanista	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,138,2);
end;	
