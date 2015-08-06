-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Desert Dhalmel	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,111,3);
end;	
