-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Cursed Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,52,2);
	checkRegime(killer,mob,53,3);
end;	
