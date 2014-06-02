-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Four of Coins	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,663,4);
end;	