-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Killing Weapon	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,716,1);
end;	