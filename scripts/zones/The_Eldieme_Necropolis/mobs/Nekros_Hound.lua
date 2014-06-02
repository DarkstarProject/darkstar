-----------------------------------	
-- Area: The Eldieme Necropolis	
-- MOB:  Nekros Hound
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,677,2);
	checkRegime(killer,mob,678,2);
end;	