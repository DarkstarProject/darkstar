-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Riparian Sahagin	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,806,1);
	checkRegime(killer,mob,807,1);
	checkRegime(killer,mob,808,1);
end;	