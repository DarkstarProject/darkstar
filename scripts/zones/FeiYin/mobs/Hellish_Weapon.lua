-----------------------------------	
-- Area: Fei'Yin
-- MOB:  Hellish Weapon	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,716,2);
end;	