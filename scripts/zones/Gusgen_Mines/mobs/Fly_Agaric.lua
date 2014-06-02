-----------------------------------	
-- Area: Gusgen Mines
-- MOB:  Fly Agaric
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,680,1);
end;	