-----------------------------------	
-- Area: Batallia Downs	
-- MOB:  Sabertooth Tiger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,74,1);
	checkRegime(killer,mob,75,1);
end;	
