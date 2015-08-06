-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Carrion Crow	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,93,1);
end;	
