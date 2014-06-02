-----------------------------------	
-- Area: Ordelle's Caves	
-- MOB:  Fly Agaric	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,656,1);
end;	