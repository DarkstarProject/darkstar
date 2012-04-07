-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Grenade (Monster)	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,71,1);
end;	
