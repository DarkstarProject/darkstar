-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Goblin Gambler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,604,2);
	checkRegime(killer,mob,605,2);
end;	
