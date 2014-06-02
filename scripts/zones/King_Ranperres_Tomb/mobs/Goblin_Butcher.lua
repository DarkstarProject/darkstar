-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Butcher
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,631,2);
	checkRegime(killer,mob,633,3);
end;	
