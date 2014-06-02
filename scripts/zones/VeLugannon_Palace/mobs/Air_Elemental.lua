-----------------------------------	
-- Area: Ve'Lugannon Palace
-- MOB:  Air Elemental	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,748,1);
end;	