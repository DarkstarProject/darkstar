-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Rock Eater
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,634,2);
end;	
