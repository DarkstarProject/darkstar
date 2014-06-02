-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Madfly
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,686,2);
end;	