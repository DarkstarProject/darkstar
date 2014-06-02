-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Vampire Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,711,1);
end;	