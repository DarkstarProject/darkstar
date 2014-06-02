-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Goblin Thug	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,647,2);
end;	