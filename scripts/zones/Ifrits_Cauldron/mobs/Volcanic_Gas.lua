-----------------------------------	
-- Area: Ifrit's Cauldron
-- MOB:  Volcanic Gas	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,755,2);
	checkRegime(killer,mob,756,2);
	checkRegime(killer,mob,757,2);
	checkRegime(killer,mob,758,2);
	checkRegime(killer,mob,759,1);
end;	