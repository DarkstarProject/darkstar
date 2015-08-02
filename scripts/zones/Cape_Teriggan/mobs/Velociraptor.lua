-----------------------------------	
-- Area: Cape Teriggan	
-- MOB:  Velociraptor	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,106,2);
	checkRegime(killer,mob,107,1);
end;	
