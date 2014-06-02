-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Goblin Tanner	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,609,1);
end;	
