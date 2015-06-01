-----------------------------------	
-- Area: Valley of Sorrows	
-- MOB:  Velociraptor	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,139,1);
	checkRegime(killer,mob,140,1);
end;	
