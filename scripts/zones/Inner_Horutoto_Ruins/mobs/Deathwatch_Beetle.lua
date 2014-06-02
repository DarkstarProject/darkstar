-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Deathwatch Beetle
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,652,1);
end;	