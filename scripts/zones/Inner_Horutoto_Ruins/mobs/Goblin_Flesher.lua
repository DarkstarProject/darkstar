-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Goblin Flesher
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,652,2);
end;	