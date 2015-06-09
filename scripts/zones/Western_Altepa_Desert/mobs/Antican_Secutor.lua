-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Antican Secutor	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,138,1);
end;	
