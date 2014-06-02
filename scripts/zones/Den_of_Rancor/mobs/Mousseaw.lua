-----------------------------------	
-- Area:  Den of Rancor
-- MOB:   Mousseaw	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,797,2);
end;	