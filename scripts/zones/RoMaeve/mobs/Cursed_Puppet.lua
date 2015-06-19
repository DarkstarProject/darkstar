-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Cursed Puppet	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,121,1);
end;	
