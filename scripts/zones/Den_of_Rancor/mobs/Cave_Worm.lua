-----------------------------------	
-- Area:  Den of Rancor
-- MOB:   Cave Worm	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,796,2);
end;	