-----------------------------------	
-- Area:  Den of Rancor
-- MOB:   Million Eyes	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,800,1);
end;	