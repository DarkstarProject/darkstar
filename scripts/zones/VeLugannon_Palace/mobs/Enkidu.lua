-----------------------------------	
-- Area: Ve'Lugannon Palace
-- MOB:  Enkidu	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,743,1);
	checkRegime(killer,mob,747,1);
end;	