-----------------------------------	
-- Area:  The Labyrinth of Onzozo
-- MOB:   Boribaba	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,776,2);
end;	