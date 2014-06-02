-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Nine of Coins	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,668,4);
end;	