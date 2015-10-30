-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Lesser Manticore	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,112,4);
	checkRegime(killer,mob,113,4);
end;	
