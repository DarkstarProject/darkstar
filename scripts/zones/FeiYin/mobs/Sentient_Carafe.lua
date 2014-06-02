-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Sentient Carafe	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,718,2);
end;	