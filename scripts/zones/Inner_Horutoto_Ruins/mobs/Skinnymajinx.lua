-----------------------------------	
-- Area: Inner Horutoto Ruins	
-- MOB:  Skinnymajinx	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,653,2);
	checkRegime(killer,mob,654,2);
end;	