-----------------------------------	
-- Area: Ifrit's Cauldron
-- MOB:  Nightmare Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,760,1);
end;	