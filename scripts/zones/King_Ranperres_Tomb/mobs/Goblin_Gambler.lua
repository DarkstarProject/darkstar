-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Gambler
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,635,3);
end;	
