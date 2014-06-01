-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Goblin Ambusher	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,632,2);
end;	
