-----------------------------------	
-- Area: Rolanberry Fields	
-- MOB:  Berry Grub	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,25,2);
	checkRegime(killer,mob,86,1);
	checkRegime(killer,mob,87,1);
end;	
