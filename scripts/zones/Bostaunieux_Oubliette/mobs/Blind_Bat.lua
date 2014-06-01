-----------------------------------	
-- Area: Bostaunieux Oubliette	
-- MOB:  Blind Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,615,1);
end;	
