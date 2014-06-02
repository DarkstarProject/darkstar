-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Mindgazer
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,811,1);
end;	