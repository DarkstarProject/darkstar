-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Mugger	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,635,1);
end;	
