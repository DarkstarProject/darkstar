-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Ironshell	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,805,1);
end;	