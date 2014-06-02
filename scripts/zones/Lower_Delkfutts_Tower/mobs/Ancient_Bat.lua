-----------------------------------	
-- Area:  Lower Delkfutt's Tower
-- MOB:   Ancient Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,777,1);
	checkRegime(killer,mob,778,1);
	checkRegime(killer,mob,779,1);
	checkRegime(killer,mob,780,1);
	checkRegime(killer,mob,781,1);
end;	