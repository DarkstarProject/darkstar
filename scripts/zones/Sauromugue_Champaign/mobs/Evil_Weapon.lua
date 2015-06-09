-----------------------------------	
-- Area: Sauromugue Champaign	
-- MOB:  Evil Weapon	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,100,2);
end;	
