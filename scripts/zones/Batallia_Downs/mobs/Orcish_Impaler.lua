-----------------------------------	
-- Area: Batallia Downs	
-- MOB:  Orcish Impaler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,74,3);
end;	
