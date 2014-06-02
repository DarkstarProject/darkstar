-----------------------------------	
-- Area:  Upper Delkfutt's Tower
-- MOB:   Magic Urn
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,788,3);
	checkRegime(killer,mob,789,3);
end;	