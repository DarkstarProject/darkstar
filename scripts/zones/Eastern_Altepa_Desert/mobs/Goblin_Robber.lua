-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Goblin Robber	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,113,2);
end;	
