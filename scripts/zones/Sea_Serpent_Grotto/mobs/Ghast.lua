-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Ghast	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,805,2);
end;	