-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Duke Focalor	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,55,1);
end;	
