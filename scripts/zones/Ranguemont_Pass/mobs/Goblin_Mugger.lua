-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Goblin Mugger	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,604,1);
end;	
