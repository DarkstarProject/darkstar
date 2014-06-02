-----------------------------------	
-- Area: Ordelle's Caves	
-- MOB:  Seeker Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,658,1);
end;	