-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  Ding Bats
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,626,1);
end;	
