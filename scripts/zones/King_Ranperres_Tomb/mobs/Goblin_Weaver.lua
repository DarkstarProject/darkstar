-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Weaver	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,631,2);
end;	
