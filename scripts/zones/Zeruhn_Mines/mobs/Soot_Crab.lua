-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  Soot Crab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,628,2);
end;	
