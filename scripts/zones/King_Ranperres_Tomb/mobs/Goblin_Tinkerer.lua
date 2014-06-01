-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Tinkerer	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,631,2);
	checkRegime(killer,mob,633,2);
end;	
