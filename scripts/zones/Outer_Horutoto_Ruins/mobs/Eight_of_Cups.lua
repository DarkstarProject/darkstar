-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Eight of Cups	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,667,1);
end;	