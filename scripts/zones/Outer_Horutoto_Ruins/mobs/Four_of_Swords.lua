-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Four of Swords	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,663,3);
end;	