-----------------------------------	
-- Area: The Boyahda Tree
-- MOB:  Snaggletooth Peapuk	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,726,2);
end;	