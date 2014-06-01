-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Wind Bats	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,632,2);
end;	
