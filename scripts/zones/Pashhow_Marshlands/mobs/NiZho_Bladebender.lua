-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  NiZho Bladebender	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,60,1);
end;	
