-----------------------------------	
-- Area: Valley of Sorrows	
-- MOB:  Valley Manticore	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,140,2);
	checkRegime(killer,mob,141,2);
end;	
