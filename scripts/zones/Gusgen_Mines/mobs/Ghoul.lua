-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Ghoul	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,679,1);
	checkRegime(killer,mob,680,2);
end;	