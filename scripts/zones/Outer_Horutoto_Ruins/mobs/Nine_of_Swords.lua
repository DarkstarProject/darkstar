-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Nine of Swords	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,668,3);
end;	