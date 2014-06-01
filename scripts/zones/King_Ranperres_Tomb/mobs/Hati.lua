-----------------------------------	
-- Area: King Ranperre's Tomb	
-- MOB:  Hati
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,637,2);
end;	
