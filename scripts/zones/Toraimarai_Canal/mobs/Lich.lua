-----------------------------------	
-- Area: Toraimarai Canal	
-- MOB:  Lich
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,619,2);
end;	
