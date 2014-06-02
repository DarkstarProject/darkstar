-----------------------------------	
-- Area:  Middle Delkfutt's Tower
-- MOB:   Gigas Jailer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,783,1);
	checkRegime(killer,mob,784,2);
end;	