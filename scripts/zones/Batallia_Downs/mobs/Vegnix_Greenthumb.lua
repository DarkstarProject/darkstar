-----------------------------------	
-- Area: Batallia Downs	
-- MOB:  Vegnix Greenthumb	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,74,2);
end;	
