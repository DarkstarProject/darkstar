-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Panna Cotta	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,614,2);
	checkRegime(killer,mob,615,2);
end;	
