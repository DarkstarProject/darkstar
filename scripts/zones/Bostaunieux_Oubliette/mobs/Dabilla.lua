-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Dabilla	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,612,1);
	checkRegime(killer,mob,614,1);
end;	
