-----------------------------------	
-- Area:  Lower Delkfutt's Tower
-- MOB:   Gigas Punisher
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,778,2);
end;	