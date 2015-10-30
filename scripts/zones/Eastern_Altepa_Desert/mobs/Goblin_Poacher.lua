-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Goblin Poacher	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,113,1);
end;	
