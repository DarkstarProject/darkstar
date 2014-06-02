-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Amphisbaena
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,682,2);
end;	