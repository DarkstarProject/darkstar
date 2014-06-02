-----------------------------------	
-- Area: Ordelle's Caves	
-- MOB:  Goblin Shaman	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,657,1);
end;	