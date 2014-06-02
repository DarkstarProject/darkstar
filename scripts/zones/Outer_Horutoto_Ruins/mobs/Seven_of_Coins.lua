-----------------------------------	
-- Area: Outer Horutoto	
-- MOB:  Seven of Coins	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,666,4);
end;	