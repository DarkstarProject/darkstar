-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Thorn Bat	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,670,1);
end;	