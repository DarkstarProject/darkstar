-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Ore Eater
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,681,1);
end;	