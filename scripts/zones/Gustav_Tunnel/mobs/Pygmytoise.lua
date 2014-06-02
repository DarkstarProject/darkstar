-----------------------------------	
-- Area: Gustav Tunnel
-- MOB:  Pygmytoise	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,770,2);
end;	