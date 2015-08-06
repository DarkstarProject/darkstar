-----------------------------------	
-- Area: Eastern Altepa Desert	
-- MOB:  Antican Decurio	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,112,1);
end;	
