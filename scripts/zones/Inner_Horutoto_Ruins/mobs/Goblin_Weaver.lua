-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Goblin Weaver	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,648,2);
end;	