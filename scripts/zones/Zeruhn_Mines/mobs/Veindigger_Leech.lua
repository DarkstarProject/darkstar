-----------------------------------	
-- Area: Zeruhn Mines	
-- MOB:  Veindigger Leech
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,630,2);
end;	
