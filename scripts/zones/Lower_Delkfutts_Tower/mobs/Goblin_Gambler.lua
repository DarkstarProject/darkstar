-----------------------------------	
-- Area:  Lower Delkfutt's Tower
-- MOB:   Goblin Gambler	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,777,2);
end;	