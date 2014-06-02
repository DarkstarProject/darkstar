-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Robber Crab	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,809,1);
	checkRegime(killer,mob,810,1);
end;	