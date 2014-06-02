-----------------------------------	
-- Area:  Seas Serpent Grotto
-- MOB:   Undead Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,804,2);
end;	