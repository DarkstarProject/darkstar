-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  River Crab
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,627,1);
end;	
