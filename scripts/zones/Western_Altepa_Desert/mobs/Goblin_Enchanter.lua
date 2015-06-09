-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Goblin Enchanter	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,137,1);
end;	
