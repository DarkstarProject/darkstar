-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  Marsh Funguar	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,24,1);
	checkRegime(killer,mob,60,2);
end;	
