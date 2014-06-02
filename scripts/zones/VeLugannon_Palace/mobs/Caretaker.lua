-----------------------------------	
-- Area: Ve'Lugannon Palace
-- MOB:  Caretaker	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,743,1);
	checkRegime(killer,mob,746,1);
end;	