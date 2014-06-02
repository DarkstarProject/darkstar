-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Bandersnatch
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,680,2);
end;	