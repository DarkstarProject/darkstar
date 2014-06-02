-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Leecher	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,635,2);
end;	
