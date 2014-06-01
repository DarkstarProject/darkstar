-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  Colliery Bat
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,628,1);
	checkRegime(killer,mob,629,1);
	checkRegime(killer,mob,630,1);
end;	
