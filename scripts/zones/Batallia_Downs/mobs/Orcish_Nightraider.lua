-----------------------------------	
-- Area: Batallia Downs	
-- MOB:  Orcish Nightraider	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,74,3);
end;	
