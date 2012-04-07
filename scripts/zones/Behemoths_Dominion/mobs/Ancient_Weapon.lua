-----------------------------------	
-- Area: Behemoths Dominion	
-- MOB:  Ancient Weapon	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,102,2);
end;	
