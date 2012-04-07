-----------------------------------	
-- Area: Batallia Downs	
-- MOB:  Goblin Mugger	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,74,2);
end;	
