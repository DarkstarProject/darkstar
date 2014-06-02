-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Greater Pugil
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,682,1);
end;	