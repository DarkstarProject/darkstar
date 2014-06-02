-----------------------------------	
-- Area:  Lower Delkfutt's Tower
-- MOB:   Chaos Idol	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,779,2);
end;	