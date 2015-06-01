-----------------------------------	
-- Area: Xarcabard	
-- MOB:  Demon Pawn	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,55,1);
end;	
