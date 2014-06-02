-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Vampire Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,806,2);
end;	