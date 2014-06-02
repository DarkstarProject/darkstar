-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Goblin Hoodoo
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,608,1);
end;	
