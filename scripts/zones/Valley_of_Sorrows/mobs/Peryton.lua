-----------------------------------	
-- Area: Valley of Sorrows	
-- MOB:  Peryton	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,139,2);
	checkRegime(killer,mob,141,1);
end;	
