-----------------------------------	
-- Area:  Den of Rancor
-- MOB:   Dire Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,796,1);
	checkRegime(killer,mob,797,1);
end;	