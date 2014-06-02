-----------------------------------	
-- Area: Ordelle's Caves	
-- MOB:  Stalking Sapling	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,655,1);
end;	