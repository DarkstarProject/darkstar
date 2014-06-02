-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  Burrower Worm
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,629,2);
end;	
