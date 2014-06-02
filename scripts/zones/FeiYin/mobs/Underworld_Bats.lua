-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Underworld Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,713,1);
	checkRegime(killer,mob,714,1);
	checkRegime(killer,mob,715,1);
end;	