-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Antican Faber	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,110,2);
	checkRegime(killer,mob,111,2);
end;	
