-----------------------------------	
-- Area: Beaucedine Glacier	
-- MOB:  Tundra Tiger	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,46,1);
	checkRegime(killer,mob,47,1);
end;	
