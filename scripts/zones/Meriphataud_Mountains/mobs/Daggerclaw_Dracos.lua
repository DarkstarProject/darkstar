-----------------------------------	
-- Area: Meriphataud Mountains	
-- MOB:  Daggerclaw Dracos	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,39,1);
end;	
