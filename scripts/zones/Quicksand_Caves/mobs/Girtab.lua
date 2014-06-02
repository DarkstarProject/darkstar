-----------------------------------	
-- Area:  Quicksand Caves
-- MOB:   Girtab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,818,1);
end;	