-----------------------------------	
-- Area:  Den of Rancor
-- MOB:   Tormentor	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,802,1);
	checkRegime(killer,mob,803,1);
end;	