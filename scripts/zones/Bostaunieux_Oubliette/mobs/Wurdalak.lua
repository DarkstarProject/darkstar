-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Wurdalak	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,617,1);
end;	
