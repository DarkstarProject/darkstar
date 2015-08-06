-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Antican Speculator	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,112,3);
end;	
