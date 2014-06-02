-----------------------------------	
-- Area:  Quicksand Caves
-- MOB:   Antican Hastatus	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,812,2);
	checkRegime(killer,mob,813,2);
	checkRegime(killer,mob,814,2);
	checkRegime(killer,mob,815,1);
	checkRegime(killer,mob,816,2);
	checkRegime(killer,mob,817,2);
	checkRegime(killer,mob,818,2);
	checkRegime(killer,mob,819,2);
end;	