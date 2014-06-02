-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Goblin Trailblazer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,651,2);
end;	