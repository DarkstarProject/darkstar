-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Antican Essedarius	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,134,2);
end;	
