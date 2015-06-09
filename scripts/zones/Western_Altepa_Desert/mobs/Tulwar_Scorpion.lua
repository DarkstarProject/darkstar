-----------------------------------	
-- Area: Western Altepa Desert	
-- MOB:  Tulwar Scorpion	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,137,2);
end;	
