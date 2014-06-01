-----------------------------------	
-- Area: Ranguemont Pass	
-- MOB:  Blade Bat	
-----------------------------------	

require("scripts/globals/fieldsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,602,2);
end;	
