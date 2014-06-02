-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Mourioche	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,720,1);
	checkRegime(killer,mob,721,1);
end;	