-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Goblin Digger	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,137,1);
end;	
