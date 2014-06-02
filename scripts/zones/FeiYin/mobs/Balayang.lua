-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Balayang	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,717,1);
	checkRegime(killer,mob,718,1);
end;	